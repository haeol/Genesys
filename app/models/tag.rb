class Tag < ApplicationRecord

  has_and_belongs_to_many :posts

  def capital_name
    name.titleize
  end

end
