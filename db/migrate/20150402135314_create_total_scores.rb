class CreateTotalScores < ActiveRecord::Migration
  def change
    create_table :total_scores do |t|
    	t.integer :semester
      t.integer :semester_credit
      t.float :semester_score
      t.float :cpa
      t.float :gpa
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :total_scores, :users
  end
end
