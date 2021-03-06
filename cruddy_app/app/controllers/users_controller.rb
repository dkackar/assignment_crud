class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    @user.save
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.save
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy

  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end



end
