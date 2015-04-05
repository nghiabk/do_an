class CreateClassStudents < ActiveRecord::Migration
  def change
    create_table :class_students do |t|
      t.string :name
      t.integer :count
      t.string :address
      t.string :specialized
      t.date :start_year
      t.date :end_year
      t.integer :semester
      t.references :faculty, index: true

      t.timestamps null: false
    end
    add_foreign_key :class_students, :faculties
  end
end
