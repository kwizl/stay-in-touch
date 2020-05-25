module UsersHelper
  def send_button(user)
    html = ''

    if !current_user.friend?(user.id)
      pending_friend = current_user.pending_friends.find { |friend| friend.id == user.id }
      if pending_friend
        title = 'Pending'
        link = '#'
      else
        title = 'Add'
        link = send_invitation_path(user_id: user.id)
      end

      html = button_to title, link, class: "btn btn-primary", disabled: pending_friend, data: { disabled_with: 'Pending' }
    end

    html.html_safe
  end

  def reject_friend(user)
    current_user.reject_friend(user)
  end
end
