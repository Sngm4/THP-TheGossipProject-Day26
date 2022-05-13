class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.create()
  end
  
  def create
   @user = User.new(first_name: params[:user_name],
      email: params[:user_email],
      password: params[:user_password],
    city: City.all.sample)
    if @user.save
      redirect_to gossips_path
    else 
      flash.now[:alert] = @user.errors.full_messages
      render 'new'
    end
  end

end
