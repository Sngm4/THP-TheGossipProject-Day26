class CommentsController < ApplicationController
  include SessionsHelper

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def new
    @comment = Comment.create()
    @gossip = Gossip.find(params[:gossip_id])
  end
  
  def create
   @comment = Comment.new(user_id: current_user.id,
      content: params[:comment_content], gossip_id: params[:gossip_id])
    if @comment.save
      redirect_to gossip_path(params[:gossip_id])
    else 
      flash.now[:alert] = @comment.errors.full_messages
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
      if @comment.update(params_comment)
    redirect_to gossip_path(params[:gossip_id])
      else
      flash.now[:alert] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end

  private 
  def params_comment
    params.require(:comment).permit(:content)
  end
end