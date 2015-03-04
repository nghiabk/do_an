class AddUserIdToScopes < ActiveRecord::Migration
  def change
    add_column :scopes, :user_id, :integer
  end
end
