class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
    tags = params[:job].delete(:tags)
    job = Job.new(params[:job])
    parse_tags(tags).each { |tag| job.tags << Tag.new(tag_name: tag) }
    current_user.jobs << job
    redirect_to user_path(current_user)
  end

  def edit
    @job = Job.find(params[:id])
    @tag_arr = @job.tags.select(:tag_name).map { |tag| tag = tag.tag_name }
  end

  def update
    job = Job.find(params[:id])
    job.tags = []
    parse_tags(params[:job].delete(:tags)).each { |tag| job.tags << Tag.new(tag_name: tag) }
    job.update(params[:job])
    redirect_to job_path(job)
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    Job.find(params[:id]).delete
    redirect_to user_path(current_user)
  end

  def search
    if params[:query].nil? && params[:tag].nil?
      @jobs = []
    elsif params[:query].nil? && params[:tag]
      @jobs = Job.joins(:tags).where(tags: { tag_name: "#{params[:tag]}" } )
    else
      @jobs = Job.search(params[:query])
    end

    respond_to do |format|
      format.html { render action: :index }
    end
  end

  def create_offer
    job = Job.find(params[:id])
    offer = Offer.create(user_id: current_user.id, job_id: job.id, made_by: current_user.my_name)
    offer.comments << Comment.create(body: params[:body], user_id: current_user.id, job_id: job.id, username: params[:username])
    job.offers << offer
    respond_to do |format|
      if job.save
        format.js { render layout: false }
        format.json { render json: job.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept_job
    job = Job.find(params.delete(:id))
    if !job.accepted
      offer = Offer.find(params.delete(:offer_id)).update(accepted: true)
      hard_offer = HardOffer.find(params.delete(:hard_offer_id)).update(accepted: true)

      accepting_id = job.user_id.eql?(current_user.id) ? params[:user_id] : current_user.id

      job.update(accepted: true, accepted_by: accepting_id, accepted_on: Time.now)
    else
      flash[:already_accepted] = true
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def reject_job
    j = Job.find(params[:id])

    j.update(accepted: false, accepted_by: nil, accepted_on: nil)
    j.offers.where("accepted = ?", true).first.update(accepted: false)
    j.hard_offers.where("accepted = ?", true).first.update(accepted: false)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def complete_job
    j = Job.find(params[:id])

    j.update(completed: true, completed_by: params[:completing_id], completed_on: Time.now)
    j.offers.where("accepted = ?", true).first.update(completed: true, completed_by: params[:completing_id], completed_on: Time.now)
    j.hard_offers.where("accepted = ?", true).first.update(completed: true, completed_by: params[:completing_id], completed_on: Time.now)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  protected
  # splits tags by '.' and stores them in the job's tag arr
  def parse_tags(tag_str)
    tag_arr = []
    arr_from_tags = tag_str.split('.')
    arr_from_tags.each { |tag| tag_arr.push(tag) if !tag_arr.include?(tag) }
    tag_arr
  end
end
