class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :user_id
      t.integer :semester
      t.integer :cost, default: 100000
      t.integer :total_credit
      t.integer :total_money
      t.boolean :submit_fee, default: false

      t.timestamps null: false
    end
  end
end
