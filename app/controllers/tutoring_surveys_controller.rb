class TutoringSurveysController < ApplicationController
  def new
    @ts = current_user.tutoring_survey
  end

  def show
    @ts = current_user.tutoring_survey
  end

  def create
    current_user.tutoring_survey = create_tutoring_survey(params)
    current_user.save
    redirect_to user_path(current_user)
  end

  protected
  def create_tutoring_survey(params)
    results_hash = { education: params[:education],
                     experience: params[:experience],
                     science: params[:sci_hidden],
                     math: params[:math_hidden],
                     languages: params[:lang_hidden],
                     music: params[:mus_hidden],
                     english: params[:english] || "n",
                     history: params[:history] || "n" }

    Survey::TutoringSurvey.new(results_hash)
  end

end
