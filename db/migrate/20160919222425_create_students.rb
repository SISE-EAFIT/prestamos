class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students, id: false do |t|
      t.string :id
      t.string :studentCode
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_index :students, :id, unique: true
    add_index :students, :studentCode, unique: true
  end
end
