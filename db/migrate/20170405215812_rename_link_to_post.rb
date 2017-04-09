class RenameLinkToPost < ActiveRecord::Migration[5.0]
  def change
    rename_table :links, :posts
  end
end
