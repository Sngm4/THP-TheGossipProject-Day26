class LikesController < ApplicationController
  include SessionsHelper

  def index
  end

  def new
    @like = Like.create
  end

  def create
    @like = Like.new(user_id: current_user.id, gossip_id: params[:gossip_id])
    if @like.save
    redirect_back(fallback_location: root_path)
    else
    render 'new'
    end
  end

  def show
  end

  def destroy
    @like = Like.find_by(gossip_id: params[:gossip_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
