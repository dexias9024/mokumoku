class Users::FollowsController < ApplicationController
  before_action :user_paramus

  def create
    Follow.create(follower_id: current_user.id, followed_id: params[:user_id])
  end
  
  def destroy
    following = Follow.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    following.destroy
  end

  private
  def user_paramus
    @user = User.find(params[:user_id])
  end
end
