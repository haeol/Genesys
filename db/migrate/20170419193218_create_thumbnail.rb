class CreateThumbnail < ActiveRecord::Migration[5.0]
  def change
    create_table :thumbnails do |t|
      t.string :url
      t.references :post, foreign_key: true
    end
  end
end
