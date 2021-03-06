class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all.order("created_at DESC")
    @idea = Idea.new
  end


  def new
    @idea = Idea.new
  end


  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end


  def show
    @idea = Idea.find params[:id]
    @comment = Comment.new

  end



private

  def idea_params
    params.require(:idea).permit(:title, :body, :image)
  end


end
