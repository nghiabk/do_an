class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :price
    	t.string :released_on
      t.timestamps null: false
    end
  end
end
