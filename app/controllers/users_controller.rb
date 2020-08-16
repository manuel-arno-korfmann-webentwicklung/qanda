class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]
  before_action :authenticate_user!, only: [:follow, :unfollow]
  
  def show
  end
  
  def index
    @users = User.all
  end
  
  def follow
    Follow.create!(following_user_id: current_user.id, followed_user_id: @user.id)
    
    redirect_to user_path(@user.id)
  end
  
  def unfollow
    Follow.where(following_user_id: current_user.id, followed_user_id: @user.id).first.destroy
    
    redirect_to user_path(@user.id)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])  
  end
end
