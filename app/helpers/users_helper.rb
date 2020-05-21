module UsersHelper
  def send_invitation
    current_user.friendships.create(friend_id: params[:user_id])
  end

  def send_button(user_id)
    class_name = current_user.friends.find() ? 'bnt-disabled' : 'btn'

    html = button_to "Add", send_invitation_path(user_id: user_id),
                      class: "btn btn-primary", disabled: current_user.friend?(user_id),
                      data: { disable_with: "Add" }
  
    html.html_safe
  end
end
