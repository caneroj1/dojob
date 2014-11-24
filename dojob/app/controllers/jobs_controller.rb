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
    offer = Offer.create(user_id: current_user.id, job_id: job.id)
    offer.comments << Comment.create(body: params[:body], user_id: current_user.id, job_id: job.id, username: params[:username])
    job.offers << offer
    respond_to do |format|
      if job.save
        format.js { render layout: false }
        format.json { render json: job.errors, status: :unprocessable_entity }
      end
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
