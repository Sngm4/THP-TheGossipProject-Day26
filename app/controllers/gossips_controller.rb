class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    flash.now[:alert] = "Yes congrats"
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.create()
  end
  
  def create
   @gossip = Gossip.new('user' => User.find(61),
      'title' => params[:gossip_title],
      'content' => params[:gossip_content])
    if @gossip.save
      redirect_to gossips_path
    else 
      flash.now[:alert] = @gossip.errors.full_messages
      render 'new'
    end
  end

end
