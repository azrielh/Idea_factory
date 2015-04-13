class JoinsController < ApplicationController

  def create
    idea = Idea.find params[:idea_id]
    join = current_user.joins.new
    join.idea = idea
    if join.save
      redirect_to idea, notice: "You have joined the idea!"
    else
      redirect_to idea, alert: "Join not working, try again!"
    end
  end

  def destroy
    join = current_user.joins.find params[:id]
    join.destroy
    redirect_to join.idea, alert: "You have been removed from the idea :("
  end

end
