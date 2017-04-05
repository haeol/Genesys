class AddUserIdToTabs < ActiveRecord::Migration[5.0]
  def change
    add_reference :tabs, :user, foreign_key: true
  end
end
