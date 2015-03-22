class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :remember_digest
      t.string :email
      t.datetime :start_date
      t.datetime :birth_day
      t.integer :faculty_id
      t.boolean :admin
      t.integer :class_student_id
    end
  end
end
