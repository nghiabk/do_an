class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :credit
      t.integer :day
      t.time :start_period
      t.time :end_period
      t.integer :semester
      t.boolean :again, default: "f"
      t.integer :subject_id
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :users
    add_foreign_key :activities, :courses
  end
end
