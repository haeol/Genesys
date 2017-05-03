class Tag < ApplicationRecord

  has_and_belongs_to_many :posts

  def capital_name
    name.titleize
  end

  def image
    thumbnails = Set.new
    posts.each do |p|
      thumbnails << p.thumbnail_image
    end
    placeholder = Set.new
    placeholder << "ColoredVinylePH.png"
    i = thumbnails - placeholder
    if (i.size > 0)
      i.take(1)[0]
    else
      "ColoredVinylePH.png"
    end
  end

end
