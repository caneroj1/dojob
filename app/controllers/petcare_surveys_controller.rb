class PetcareSurveysController < ApplicationController
  def new
    @ts = current_user.petcare_survey
  end

  def show
    @ts = current_user.petcare_survey
  end

  def create
    current_user.petcare_survey = create_petcare_survey(params)
    current_user.save
    redirect_to user_path(current_user)
  end

  protected
  def create_petcare_survey(params)
    results_hash = { experience: params[:experience], misc: params[:misc], pets: params[:pets] }
    Survey::PetcareSurvey.new(results_hash)
  end
end
