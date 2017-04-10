class Post < ApplicationRecord

  include Filterable # located in ./concerns/filterable.rb
	# filter can ONLY take these parameters
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  scope :tag, -> (tag_name) { Tag.find_by_name(tag_name).posts  }

  require 'action_view'
  include ActionView::Helpers::DateHelper

  belongs_to :user
  has_and_belongs_to_many :tags

  # Creating new posts
  def copy(user_id)
    post = dup
    post.user_id = user_id
    post
  end

  def add_tags(tags)
    tags.split(" ").each do |t|
      strip = strip_tag(t)
      tag = Tag.where(:name => strip)

      # create tag if doesn't exist
      if tag.blank?
        tag = Tag.new(:name => strip)
        tag.save
      end
      self.tags << tag
    end
  end
  # end creating new posts
  

  # Filtering / Retrieving Tabs

  # check concerns/filterable.rb for methods

  # end filtering and tabs


  # Utility
  def strip_tag(tag)
    tag.gsub(/[^0-9a-z ]/i, '').downcase
  end
  # end utility


  # Formatted information
  def original_poster
    # TODO change this to username instead of email once username implemented
    User.find(self.original_poster_id).email
  end

  def poster
    # TODO change this to username instead of email once username implemented
    self.user.email
  end

  def submit_time_diff
    "Submitted #{distance_of_time_in_words(self.created_at, Time.now)} ago"
  end
  #end formatted information
  

end
