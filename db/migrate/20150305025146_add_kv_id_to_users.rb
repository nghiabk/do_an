class AddKvIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kv_id, :integer
  end
end
