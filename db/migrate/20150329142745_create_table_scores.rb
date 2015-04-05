class CreateTableScores < ActiveRecord::Migration
  def change
    create_table :table_scores do |t|
    	t.float :middle_score
      t.float :end_score
      t.float :finish_score
      t.integer :semester
      t.integer :credit
      t.integer :activity_id
      t.references :user, index: true
      t.references :score, index: true

      t.timestamps null: false
    end
    add_foreign_key :table_scores, :users
    add_foreign_key :table_scores, :scores
  end
end
