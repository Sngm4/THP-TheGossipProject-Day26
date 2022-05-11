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
    
  end

  private 
  def params_gossip
    params.require(:gossip).permit(:content, :title)
  end
end
