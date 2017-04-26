class CreateEmbeddedHtml < ActiveRecord::Migration[5.0]
  def change
    create_table :embedded_htmls do |t|
      t.text :html
      t.references :post, foreign_key: true
    end
  end
end
