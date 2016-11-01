class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.date :date
      t.integer :quantity
      t.references :student, foreign_key: true
      t.references :element, foreign_key: true

      t.timestamps
    end
  end
end
