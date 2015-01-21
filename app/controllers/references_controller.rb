class ReferencesController < ApplicationController
  def update
    reference = Reference.find_by_id(params[:id])
    reference.update(params[:reference])

    respond_to do |format|
      format.json { respond_with_bip(reference) }
    end
  end

  def create
    reference_hash = { first_name:     params[:first_name],
                       last_name:      params[:last_name],
                       contact_email:  params[:contact_email],
                       contact_number: params[:contact_number] }


    reference = Reference.create(reference_hash)
    make_tags(reference, params)
    current_user.references << reference

    params[:id] = reference.id

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    reference = Reference.find_by_id(params[:id])
    reference.delete

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private
  def make_tags(reference, params)
    tag_names = %w{Pet_Care Lawn_Care Babysitting Tutoring Oddjobs Errands Handyman Shopping }.each do |tag|
        reference.reference_tags.push(ReferenceTag.new(tag_name: tag.gsub(/_/, " "))) if params.has_key?(tag)
    end
  end
end
