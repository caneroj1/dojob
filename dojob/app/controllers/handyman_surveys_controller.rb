class HandymanSurveysController < ApplicationController
  def show
    @hs = current_user.handyman_survey
  end

  def new
    @hs = current_user.handyman_survey
  end
end
