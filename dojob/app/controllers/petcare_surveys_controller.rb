class PetcareSurveysController < ApplicationController
  def new
    @ts = current_user.petcare_survey
  end

  def show
    @ts = current_user.petcare_survey
  end

  def create
    current_user.petcare_survey = create_petcare_survey(params, check_if_existing_survey)
    current_user.save
    redirect_to user_path(current_user)
  end

  protected
  def create_petcare_survey(params, old_certs)
    results_hash = { experience: params[:experience], misc: params[:misc], pets: params[:pets] }

    pcs = Survey::PetcareSurvey.new(results_hash)
    pcs.certifications = []
    if !params[:num_certs].eql?("no")
      params[:num_certs].to_i.times { |cert| pcs.certifications << Certification::Certification.new(params["cert_title_#{cert + 1}"], params["cert_exp_#{cert + 1}"]) }
    end

    old_certs.each { |cert| pcs.certifications << cert } if !old_certs.nil?
    pcs
  end

  def check_if_existing_survey
    current_user.petcare_survey.nil? ? nil : current_user.petcare_survey.certifications
  end
end
