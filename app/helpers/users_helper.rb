module UsersHelper
  def send_button(user)
    html = ''

    if !current_user.friend?(user) && current_user != user
      pending_friend = current_user.pending_friends.find { |friend| friend.id == user.id }
      if pending_friend
        title = 'Pending'
        link = '#'
      else
        title = 'Add'
        link = send_invitation_path(user_id: user.id)
      end

      html = button_to title, link, class: 'btn btn-primary',
                                    disabled: pending_friend,
                                    data: { disabled_with: 'Pending' }
    end

    html.html_safe
  end

  def index_helper
    html = ''

    @users.each do |user|
      html += <<-HTML
      <li>
        Name: #{user.name}
        <span class="profile-link">
          #{link_to 'See Profile', user_path(user), class: 'profile-link'}
        </span>
        #{send_button(user)}
      </li>
      HTML
    end
    html.html_safe
  end

  def user_invitations_helper
    html = ''

    @invites.each do |user|
      html += <<-HTML
      <li>
        Name: #{user.name}
        <span class="profile-link">
          #{link_to 'See Profile', user_path(user), class: 'profile-link'}
        </span>
        #{button_to 'Accept', update_friendship_path({ friendship: user, new_status: 'a' }), { class: 'btn btn-primary', method: :patch }}
        #{button_to 'Reject', user, method: :delete, data: { confirm: 'Are you sure?' }}
      </li>
      HTML
    end
    html.html_safe
  end

  def reject_friend(user)
    current_user.reject_friend(user)
  end
end
