class AddLopSvIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lop_sv_id, :integer
  end
end
