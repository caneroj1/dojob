class ChildcareSurveysController < ApplicationController
  def new
    @ccs = current_user.childcare_survey
  end

  def show
    @ccs = current_user.childcare_survey
  end

  def create
    current_user.childcare_survey = create_childcare_survey(params, check_if_existing_survey)
    current_user.save
    redirect_to user_path(current_user)
  end

  protected
  def create_childcare_survey(params, old_certs)
    results_hash = { experience: params[:experience],
                     misc: params[:misc],
                     age_range: params[:range],
                     number_kids: params[:count] }

    ccs = Survey::ChildcareSurvey.new(results_hash)
    ccs.certifications = []
    if !params[:num_certs].eql?("no")
      params[:num_certs].to_i.times { |cert| ccs.certifications << Certification::Certification.new(params["cert_title_#{cert + 1}"], params["cert_exp_#{cert + 1}"]) }
    end
    old_certs.each { |cert| ccs.certifications << cert } if !old_certs.nil?
    ccs
  end

  def check_if_existing_survey
    current_user.childcare_survey.nil? ? nil : current_user.childcare_survey.certifications
  end
end
