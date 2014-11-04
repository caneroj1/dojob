class JobsController < ApplicationController
  def create
    job = Job.create(params[:job])
    job.save
    # if(job.save)
    #   redirect_to user_path(current_user)
    # else
    #   render
    # end
  end
end
