class JobsController < ApplicationController
  def create
    job = Job.create(params[:job])
    current_user.jobs << job
    job.save
    redirect_to user_path(current_user)
  end
end
