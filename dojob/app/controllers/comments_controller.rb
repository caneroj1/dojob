class CommentsController < ApplicationController
  def new
    @comment = Comment.new

    comments_and_offers = Comment.where("offer_id = ?", params[:offer_id])
    comments_and_offers.concat(HardOffer.where("job_id = ?", params[:job_id]))

    @comments = comments_and_offers.sort_by { |comment| comment.created_at }

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
    @comment = Comment.create(params[:comment])
    if !@comment.save
      flash[:error] = 'There was an error posting that message.'
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
