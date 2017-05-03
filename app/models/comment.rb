class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  include Filterable # located in ./concerns/filterable.rb

	# filter can ONLY take these parameters
  scope :starts_with, -> (word) {
    where("lower(description) like ?", "%#{word.downcase}%")
  }

  def username
    user.username
  end
end
