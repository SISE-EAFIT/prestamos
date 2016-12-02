class CreateLends < ActiveRecord::Migration[5.0]
  def change
    create_table :lends do |t|
      t.date :date
      t.integer :quantity
      t.string :student_id
      t.string :element_id

      t.timestamps
    end
  end
end
