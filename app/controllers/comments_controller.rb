class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.idea = @idea
    @comment.user = current_user

    if @comment.save
      redirect_to idea_path(@idea)
    else
      render 'ideas/show'
    end
  end


end
