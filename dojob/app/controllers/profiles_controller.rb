class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @references = @user.references
    @availability = @user.availability
  end

  def edit
    @availability = current_user.availability
    @references = current_user.references
  end

  def mark_availability
    current_user.availability.store(params[:name], params[:available])
    current_user.save
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def submit_availability
    hours = params[:hours].split(',')

    (hours[0].to_i..hours[1].to_i).each { |hour| current_user.availability.store("#{params[:day]}#{convert_to_key(hour)}", "0") }
    current_user.save

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def clear_availability
    current_user.availability = {}
    current_user.save
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  protected
  def convert_to_key(hour)
    case
    when (hour.eql? -4)
      "8am"
    when (hour.eql? -3)
      "9am"
    when (hour.eql? -2)
      "10am"
    when (hour.eql? -1)
      "11am"
    when (hour.eql? 0)
      "12pm"
    else
      "#{hour}pm"
    end
  end
end
