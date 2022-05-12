class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index, :create, :edit, :update, :destroy]
  include SessionsHelper

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all
  end

  def new
    @gossip = Gossip.create
  end

  def create
    @gossip = Gossip.new(user_id: current_user.id,
      'title' => params[:gossip_title],
      'content' => params[:gossip_content])
    if @gossip.save
      redirect_to gossips_path
      flash.now[:alert] = 'Yes congrats'
    else
      flash.now[:alert] = @gossip.errors.full_messages
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(params_gossip)
      redirect_to gossip_path(params[:id])
    else
      flash.now[:alert] = @gossip.errors.full_messages
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def params_gossip
    params.require(:gossip).permit(:content, :title)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = 'Please log in.'
      redirect_to new_session_path
    end
  end
end
