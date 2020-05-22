class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!

  def index
    @users = User.find_by_sql(["SELECT * FROM users WHERE id != ? ", current_user.id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
  
  def follow_user
    user_id = params[:user_id]
    if Friendship.create(user_id: current_user.id, friend_id: user_id)
      flash[:success] = "Request Sent"
    else
      flash[:danger] = "Failure to send request"
    end
    redirect_to users_path
  end
end
