class Post < ApplicationRecord

  include LinkParser
  include Filterable # located in ./concerns/filterable.rb

	# filter can ONLY take these parameters
  scope :starts_with, -> (name) {
    where("lower(name) like ?", "%#{name.downcase}%")
  }
  scope :contains, -> (name) {
    where("lower(name) like ?", "%#{name.downcase}%")
  }
  scope :tag, -> (tag_name) {
    Tag.find_by_name(tag_name.gsub(/[^0-9a-z ]/i, '').downcase).posts
  }
  scope :tag_id, -> (tag_id) {
    Tag.find(tag_id).posts
  }
  # end filter params

  require 'oembed'
  require 'action_view'
  include ActionView::Helpers::DateHelper

  belongs_to :user
  has_and_belongs_to_many :tags

  # in has_many assiciation
  # :delete_all causes all the associated objects to be deleted directly from the database (so callbacks will not execute)
  has_many :comments, :dependent => :delete_all
  has_one :thumbnail, :dependent => :destroy
  has_one :embedded_html, :dependent => :destroy

  # Creating posts
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

  def add_thumbnail
    begin
      thumbnail_url = OEmbed::Providers.get(self.url).thumbnail_url
    rescue OEmbed::NotFound
      thumbnail_url = nil
    end
    if thumbnail_url
      build_thumbnail({url: thumbnail_url})
    end
  end

  def add_html
    begin
      html = OEmbed::Providers.get(self.url).html.html_safe
    rescue OEmbed::NotFound
      html = nil
    end
    if html
      build_embedded_html({html: html})
    end
  end
  # end creating new posts


  # Creating comments
  def new_comment(user)
    comments.build({user_id: user.id})
  end
  # end creating comments


  # Filtering / Retrieving Tabs

  # check concerns/filterable.rb for methods

  # end filtering and tabs


  # Utility
    #TODO put regular expressions in a module
  def strip_tag(tag)
    tag.gsub(/[^0-9a-z ]/i, '').downcase
  end

  def star_rating
    "★"*rating.round if rating#+ (5 - rating)*"☆"
  end

  #def embedded_html
  #  begin
  #    OEmbed::Providers.get(self.url).html.html_safe
  #  rescue OEmbed::NotFound
  #    nil
  #  end
  #end

  def thumbnail_image
    if thumbnail
      thumbnail.url
    else
      "ColoredVinylePH.png"
    end
  end

  def html
    if self.embedded_html
      self.embedded_html.html.html_safe
    else
      nil
    end
  end

  # end utility


  # Formatted information
  def original_poster
    # TODO change this to username instead of email once username implemented
    User.find(self.original_poster_id).username
  end

  def poster
    # TODO change this to username instead of email once username implemented
    self.user.username
  end

  def submit_time_diff
    "#{distance_of_time_in_words(self.created_at, Time.now)}"
  end
  #end formatted information

  def delete_tags
    tags.each do |t|
      if t.posts.length == 1 && t.posts.find(id) == self
        t.destroy
      end
    end
  end


end
