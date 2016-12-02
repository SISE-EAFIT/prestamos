class CreatePost2s < ActiveRecord::Migration[5.0]
  def change
    create_table :post2s do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
