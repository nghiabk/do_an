class CreateLopsvs < ActiveRecord::Migration
  def change
    create_table :lopsvs do |t|
      t.string :name
      t.integer :count
      t.integer :faculty_id
      t.string :address
      t.string :specialized
      t.datetime :start_year
      t.datetime :end_year
      t.integer :semester
    end
  end
end
