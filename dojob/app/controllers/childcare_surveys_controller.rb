class ChildcareSurveysController < ApplicationController
  def new
    @ccs = current_user.childcare_survey
  end

  def show
    @ccs = current_user.childcare_survey
  end

  def create
    current_user.childcare_survey = create_childcare_survey(params)
    current_user.save
    redirect_to user_path(current_user)
  end

  protected
  def create_childcare_survey(params)
    results_hash = { experience: params[:experience],
                     misc: params[:misc],
                     age_range: params[:range],
                     number_kids: params[:count] }

    Survey::ChildcareSurvey.new(results_hash)
  end
end
