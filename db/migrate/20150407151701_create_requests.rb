class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :class_name
      t.integer :class_student_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
