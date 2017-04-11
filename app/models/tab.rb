class Tab < ApplicationRecord
  belongs_to :user
  has_one :tag

  # to get current user tabs, call current_user.tabs

  def posts
    Post.filter(:tag_id => self.tag_id)
  end

end
