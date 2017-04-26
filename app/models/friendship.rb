class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def sender
    User.find(self.user_id)
  end

  def accepter
    User.find(self.friend_id)
  end

end
