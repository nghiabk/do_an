class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :faculty_id
      t.string :name
    end
  end
end
