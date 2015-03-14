class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.integer :semester
      t.string :subject_id
      t.integer :count
      t.integer :class_id
      t.float :middle_scope
      t.float :end_scope
      t.string :letter
    end
  end
end
