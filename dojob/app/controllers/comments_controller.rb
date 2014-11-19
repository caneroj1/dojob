class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comment.order('created_at ASC').where("offer_id = ?", params[:offer_id])
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
