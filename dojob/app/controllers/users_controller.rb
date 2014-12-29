class UsersController < ApplicationController
  def index
  end

  def show
  end

  def update
    current_user.update(params[:user])
    redirect_to user_path(current_user)
  end

  def accepted_jobs
    @accepted_jobs = Job.where('accepted_by = ? AND completed_by = ?', params[:id], nil)
    render layout: false
  end

  def completed_jobs
    @completed_jobs = Job.where('completed_by = ?', params[:id])
    render layout: false
  end
end
