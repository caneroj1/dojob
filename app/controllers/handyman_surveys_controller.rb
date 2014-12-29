class HandymanSurveysController < ApplicationController
  def show
    @hs = current_user.handyman_survey
  end

  def new
    @hs = current_user.handyman_survey
    puts @hs.inspect
  end

  def create
    current_user.handyman_survey = create_handyman_survey(params)
    current_user.save
    redirect_to user_path(current_user)
  end

  protected
  def create_handyman_survey(params)
    results_hash = {
      plumbing: params[:plumbing],
      plumbing_expertise: params[:plumbing_expertise],
      carpentry: params[:carpentry],
      carpentry_expertise: params[:carpentry_expertise],
      electrical: params[:electrical],
      electrical_expertise: params[:electrical_expertise],
      automotive: params[:automotive],
      automotive_expertise: params[:automotive_expertise],
      hvac: params[:hvac],
      hvac_expertise: params[:hvac_expertise],
      equipment: params[:equipment]
    }
    Survey::HandymanSurvey.new(results_hash)
  end
end
