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

  def calculate_accepted_jobs
    data_hash = { "Pet Care" => 0,
                  "Tutoring" => 0,
                  "Shopping" => 0,
                  "Handyman" => 0,
                  "Babysitting" => 0,
                  "Lawn Care" => 0,
                  "Errands" => 0,
                  "Odd Jobs" => 0 }

    jobs = Job.where("accepted_by = ? AND completed_by IS ?", current_user.id, nil)

    if !jobs.empty?
      jobs.each do |job|
        job.tags.each { |tag| data_hash[tag.tag_name] += 1 }
      end
    end

    @data = data_hash.values
    render layout: false
  end
end
