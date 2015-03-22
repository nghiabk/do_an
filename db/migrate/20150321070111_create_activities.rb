class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.boolean :status
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :users
    add_foreign_key :activities, :courses
  end
end
