class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tabs, dependent: :destroy # delete personalized tabs if user destroyed
  has_many :posts
  has_many :comments

  def viewableposts
    if posts
      posts.order('created_at DESC').limit(50)
    end
  end

end
