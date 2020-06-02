class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!

  def index
    @users = User.users_index(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def user_invitations
    @invites = Friendship.invitations(current_user.id)
  end
end
