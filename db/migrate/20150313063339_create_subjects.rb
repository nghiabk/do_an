class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :faculty_id
      t.integer :count
      t.string :name
      t.timestamps null: false
    end
  end
end
