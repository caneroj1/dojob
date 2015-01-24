class CertificationsController < ApplicationController
  def create
    current_user.certifications << Certification.new(params[:certification])
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
