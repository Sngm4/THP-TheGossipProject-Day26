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
    new_gossip1 = params.require(:gossip).permit(:content, :title)
    if @gossip.update(new_gossip1)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  private 
  def new_gossip
    params.require(:gossip).permit(:content, :title)
  end
end
