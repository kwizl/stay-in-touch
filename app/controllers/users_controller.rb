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
 
  def user_invitations
    @invites = User.find_by_sql(
      ["SELECT * FROM users u JOIN friendships f ON u.id = f.user_id WHERE f.status = 'p' AND f.friend_id = ?", current_user.id])
  end

  def accept

  end

  def reject

  end 
end
