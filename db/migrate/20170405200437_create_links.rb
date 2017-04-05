class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.references :original_poster
      t.integer :rating
      t.string :url
    end
  end
end
