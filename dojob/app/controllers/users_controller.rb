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
    @accepted_jobs = Job.where('accepted_by = ?', params[:id])
    render layout: false
  end
end
