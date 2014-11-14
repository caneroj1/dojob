class ChildcareSurveysController < ApplicationController
  def new
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

    ccs = Survey::ChildcareSurvey.new(results_hash)
    ccs.certifications = []
    params[:num_certs].to_i.times { |cert| ccs.certifications << Certification::Certification.new(params["cert_title_#{cert + 1}"], params["cert_exp_#{cert + 1}"]) }
    ccs
  end
end
