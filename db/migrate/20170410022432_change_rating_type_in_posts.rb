class ChangeRatingTypeInPosts < ActiveRecord::Migration[5.0]
  def up
    change_column :posts, :rating, :float
  end
  def down
    change_column :posts, :rating, :integer
  end
end
