class Users::FollowsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user)
  end
  
  def destroy
    current_user.unfollow(@user) if current_user.following?(@user)
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
