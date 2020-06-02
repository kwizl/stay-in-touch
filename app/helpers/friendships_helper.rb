module FriendshipsHelper
  def index_friendships_helper
    html = ''
    @friends.each do |user|
      html += <<-HTML
      <li>
        Name: #{ user.name }
        <span class="profile-link">
          #{ link_to 'See Profile',  user_path(user), class: 'profile-link' }
        </span>
      </li>
      HTML
    end
    html.html_safe
  end
end
