class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :remember_digest
      t.string :email
      t.date :start_year
      t.date :birth_day
      t.boolean :admin
      t.references :faculty, index: true
      t.references :class_student, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :faculties
    add_foreign_key :users, :class_students
  end
end
