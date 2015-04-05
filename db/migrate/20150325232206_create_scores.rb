class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :semester
      t.integer :credit
      
      t.integer :course_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
