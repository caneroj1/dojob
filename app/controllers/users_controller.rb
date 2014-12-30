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
    @accepted_jobs = Job.where('accepted_by = ? AND completed_by IS ?', params[:id], nil)
    render layout: false
  end

  def completed_jobs
    @completed_jobs = Job.where('completed_by = ?', params[:id])
    render layout: false
  end

  def contacts
    @contacts = current_user.contacts
    render layout: false
  end

  def calculate_accepted_jobs
    data_hash = { "Pet Care" => 0,
                  "Tutoring" => 0,
                  "Shopping" => 0,
                  "Handyman" => 0,
                  "Babysitting" => 0,
                  "Lawn Care" => 0,
                  "Errands" => 0,
                  "Odd Jobs" => 0 }

    jobs = Job.where("accepted_by = ? AND completed_by IS ? AND accepted_on >= ?", current_user.id, nil, time_calculation(params[:time]))

    if !jobs.empty?
      jobs.each do |job|
        job.tags.each { |tag| data_hash[tag.tag_name] += 1 }
      end
    end

    @content = format_info(params[:time], "accepted")
    @data = data_hash.values

    @data = [] if all_zero?(@data)

    render layout: false
  end

  def calculate_completed_jobs
    data_hash = { "Pet Care" => 0,
                  "Tutoring" => 0,
                  "Shopping" => 0,
                  "Handyman" => 0,
                  "Babysitting" => 0,
                  "Lawn Care" => 0,
                  "Errands" => 0,
                  "Odd Jobs" => 0 }

    jobs = Job.where("accepted_by = ? AND completed_by = ? AND completed_on >= ?", current_user.id, current_user.id, time_calculation(params[:time]))

    if !jobs.empty?
      jobs.each do |job|
        job.tags.each { |tag| data_hash[tag.tag_name] += 1 }
      end
    end

    @content = format_info(params[:time], "completed")
    @data = data_hash.values

    @data = [] if all_zero?(@data)

    render layout: false
  end

  def add_contact
    contact_name = User.find(params[:contact_id]).my_name
    current_user.contacts << Contact.create(contact_id: params[:contact_id], contact_name: contact_name)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def remove_contact
    current_user.contacts.find_by_contact_id(params[:contact_id]).delete

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private
  def time_calculation(time)
    case time
    when "10days"
      Time.now - 864000 # 10 days ago
    when "30days"
      Time.now - 2592000 # 30 days ago
    when "all"
      Time.utc(1900)
    end
  end

  def format_info(time, word)
    case time
    when "10days"
      "These are the jobs you've #{word} in the past 10 days."
    when "30days"
      "These are the jobs you've #{word} in the past 30 days."
    when "all"
      "These are all of the jobs you've ever #{word}."
    end
  end

  def all_zero?(data)
    data.inject { |result, item| result += item }.eql?(0) ? true : false
  end
end
