class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
    tags = params[:job].delete(:tags)
    job = Job.new(params[:job])
    job.tags = parse_tags(tags)
    current_user.jobs << job
    redirect_to user_path(current_user)
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    Job.find(params[:id]).delete
    redirect_to user_path(current_user)
  end

  def search
    if params[:query].nil?
      @jobs = []
    else
      @jobs = Job.search(params[:query])
    end

    respond_to do |format|
      format.html { render action: :index }
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
