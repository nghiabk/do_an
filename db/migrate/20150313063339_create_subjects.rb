class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :faculty_id
      t.integer :credit
      t.string :name
      t.timestamps null: false
    end
  end
end
