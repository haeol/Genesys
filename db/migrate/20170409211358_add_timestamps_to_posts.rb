class AddTimestampsToPosts < ActiveRecord::Migration[5.0]
  def change
    change_table :posts do |t|
      t.timestamps
    end
  end
end
