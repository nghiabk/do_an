class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :faculty_id
      t.string :name
      t.integer :semester
      t.integer :class_id
      t.integer :max
      t.integer :count
      t.boolean :status
      t.string :teacher
      t.integer :subject_id

      t.timestamps
    end
  end
end
