class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tabs, dependent: :destroy # delete personalized tabs if user destroyed
  has_many :posts
  has_many :comments
  has_many :friend_feed

  has_many :friendships

  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

  scope :all_except, ->(user) { where.not(id: user) }

  def strangers
    User.where("id NOT IN (?)", friends | [self])
  end

  def viewableposts
    if posts
      posts.order('created_at DESC').limit(50)
    end
  end

  def friends
    active_friends | received_friends
  end

  def pending_requests
    received_friendships.where(accepted: "false")
  end
  def pending
    pending_friends | requested_friendships
  end

end
