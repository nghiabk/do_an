class RenameLopsvsTableToClasses < ActiveRecord::Migration
  def change
  	rename_table :lopsvs, :classes
  end
end
