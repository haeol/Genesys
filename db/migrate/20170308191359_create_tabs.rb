class CreateTabs < ActiveRecord::Migration[5.0]
  def change
    create_table :tabs do |t|
      t.string :tag
      t.integer :order

      t.timestamps
    end
  end
end
