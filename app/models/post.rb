class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000,
                                                too_long: '1000 characters in post is the maximum allowed.' }

  belongs_to :user

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.posts_timeline(current_user)
    find_by_sql(['SELECT p.*, u.name user_name
      FROM posts p
      JOIN users u ON u.id = p.user_id
      LEFT JOIN friendships f ON f.user_id = p.user_id
      AND f.friend_id = ?
      AND f.status = \'a\'
      WHERE COALESCE(f.friend_id, p.user_id) = ?
      ORDER BY p.created_at DESC', current_user, current_user])
  end
end
