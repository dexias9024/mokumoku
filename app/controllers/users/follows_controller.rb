class Users::FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    Follow.create(follower_id: current_user.id, followed_id: params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    following = Follow.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    following.destroy
  end
end
