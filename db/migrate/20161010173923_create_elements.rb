class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements, id: false do |t|
      t.string :id
      t.string :name
      t.text :description
      t.boolean :loaned

      t.timestamps
    end
    #add_index :elements, :id, unique: true
  end
end
