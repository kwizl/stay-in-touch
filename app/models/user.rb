class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def pending
    self.status = 'p'
  end

  def friends
    friends_array = friendships.map{ |friendship| friendship.friend if friendship.status == 'a' }
    friends_array.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{ |friendship| friendship.user == user }
    friendship.status = 'a'
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def pending_friends
    friends_array = friendships.map{ |friendship| friendship.friend if friendship.status == 'p' }
    friends_array.compact
  end

  def reject_friend(user)
    friendship = inverse_friendships.find{ |friendship| friendship.user == user }
    friendship.status = 'r'
    friendship.save
  end
end
