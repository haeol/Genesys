class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def username
    user.email
  end
end
