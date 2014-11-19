class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comment.order('created_at DESC')
  end

  def create
    @comment = Comment.create(params[:comment])
    if !@comment.save
      flash[:error] = 'There was an error posting that message.'
    end
  end
end
