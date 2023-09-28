class Users::FollowsController < ApplicationController
  before_action :set_user

  def create
    Follow.create(follower_id: current_user.id, followed_id: params[:user_id])
  end
  
  def destroy
    following = Follow.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    if following.nil?
      return
    else
      following.destroy
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
