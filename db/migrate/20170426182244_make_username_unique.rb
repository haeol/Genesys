class MakeUsernameUnique < ActiveRecord::Migration[5.0]
  def up
    add_index :users, :username, unique: true
  end
end
