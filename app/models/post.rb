class Post < ApplicationRecord

  include Filterable # located in ./concerns/filterable.rb

	# filter can ONLY take these parameters
  scope :starts_with, -> (name) {
    where("lower(name) like ?", "%#{name.downcase}%")
  }
  scope :tag, -> (tag_name) { 
    Tag.find_by_name(tag_name.gsub(/[^0-9a-z ]/i, '').downcase).posts
  } 
  scope :tag_id, -> (tag_id) {
    Tag.find(tag_id).posts
  }
  # end filter params


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
    #TODO put regular expressions in a module
  def strip_tag(tag)
    tag.gsub(/[^0-9a-z ]/i, '').downcase
  end

  def youtube?
    #self.url =~ /^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$/
    youtube_id = self.url.match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/)
    if youtube_id
      youtube_id = youtube_id[1]
    end
    youtube_id
  end

  # TODO
  def soundcloud?
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
