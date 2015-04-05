class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :faculty_id
      t.integer :semester
      t.integer :class_student_id
      t.integer :max
      t.integer :min
      t.integer :count ,default: 0
      t.boolean :state ,default: "true"
      t.string :address
      t.integer :start_week
      t.integer :end_week
      t.integer :day
      t.integer :start_period
      t.integer :end_period
      t.string :teacher
      t.integer :subject_id
      t.timestamps null: false
    end
  end
end
