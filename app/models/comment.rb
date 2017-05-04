class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  include Filterable # located in ./concerns/filterable.rb
  require 'action_view'
  include ActionView::Helpers::DateHelper

	# filter can ONLY take these parameters
  scope :starts_with, -> (word) {
    where("lower(description) like ?", "%#{word.downcase}%")
  }

  def username
    user.username
  end

  def submit_time_diff
    "#{distance_of_time_in_words(self.created_at, Time.now)}"
  end

end
