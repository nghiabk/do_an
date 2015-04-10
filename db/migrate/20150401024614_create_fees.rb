class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :user_id
      t.integer :semester
      t.float :cost
      t.integer :total_credit
      t.float :total_money

      t.timestamps null: false
    end
  end
end
