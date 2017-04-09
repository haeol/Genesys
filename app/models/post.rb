class Post < ApplicationRecord
  #include Filterable # TODO get module to work, located in ./concerns/filterable.rb

  belongs_to :user
  has_and_belongs_to_many :tags

  #scope :name, -> (name) { where name: name }

  # setter
  #def original_poster_id=(id)
  #  @original_poster_id = id
  #end

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

  def strip_tag(tag)
    tag.gsub(/[^0-9a-z ]/i, '').downcase
  end

  def original_poster
    User.find(self.original_poster_id)
  end
  

end
