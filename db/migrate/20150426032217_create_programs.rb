class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :semester
      t.references :class_student, index: true
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :programs, :class_students
    add_foreign_key :programs, :subjects
  end
end
