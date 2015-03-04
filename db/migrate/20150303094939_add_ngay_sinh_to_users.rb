class AddNgaySinhToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ngay_sinh, :datetime
  end
end
