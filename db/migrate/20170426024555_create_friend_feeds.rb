class CreateFriendFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_feeds do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :post_id

      t.timestamps
    end
  end
end
