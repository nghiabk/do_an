class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.integer :level
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :disciplines, :users
  end
end
