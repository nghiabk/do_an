class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.float :total_money
      t.integer :total_credit
      t.integer :semester
      t.float :cost
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
