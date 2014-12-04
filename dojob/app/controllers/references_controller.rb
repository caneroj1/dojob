class ReferencesController < ApplicationController
  def update
    reference = Reference.find_by_id(params[:id])
    reference.update(params[:reference])

    respond_to do |format|
      format.json { respond_with_bip(reference) }
    end
  end

  def destroy
    reference = Reference.find_by_id(params[:id])
    reference.delete

    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
