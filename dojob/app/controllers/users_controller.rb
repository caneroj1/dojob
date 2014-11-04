class UsersController < ApplicationController
  def index
  end

  def show
  end

  def update
    current_user.update(params[:user])
    redirect_to user_path(current_user)
  end
end
