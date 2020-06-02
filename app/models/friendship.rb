class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_uniqueness_of :user_id, scope: :friend_id

  def self.invitations(current_user)
    find_by_sql(
      ["SELECT * FROM users u JOIN friendships f ON u.id = f.user_id
      WHERE f.status = 'p' AND f.friend_id = ?", current_user]
    )
  end
end
