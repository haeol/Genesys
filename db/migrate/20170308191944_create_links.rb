class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :rating
      t.string :category

      t.timestamps
    end
  end
end
