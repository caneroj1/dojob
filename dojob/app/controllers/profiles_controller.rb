class ProfilesController < ApplicationController
  def show
    @availability = User.find(params[:id]).availability
  end

  def edit
    @availability = User.find(params[:id]).availability
  end

  def mark_availability
    current_user.availability.store(params[:name], params[:available])
    current_user.save
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
