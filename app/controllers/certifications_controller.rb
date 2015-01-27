class CertificationsController < ApplicationController
  def create
    new_cert = Certification.new(params[:certification])
    current_user.certifications << new_cert
    params[:id] = new_cert.id
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    Certification.delete(params[:id])
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
