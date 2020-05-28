class FriendshipsController < ApplicationController
  before_action :set_status, only: [:update]
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to users_path, notice: 'Friendship request was successfully sent.' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { redirect_to users_path }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @friendship = Friendship.find(params[:friendship])

    return unless @friendship.update(friendship_params)

    flash[:notice] = 'Invitation successfully accepted.'
    redirect_to user_invitations_path
  end

  def destroy
    @invites = Friendship.find(params[:id])

    return unless @invites.destroy

    flash[:notice] = 'Invitation was successfully rejected.'
    redirect_to user_invitations_path
  end

  private

  def friendship_params
    params.permit(:status)
  end

  def set_status
    params[:status] = params[:new_status]
  end
end
