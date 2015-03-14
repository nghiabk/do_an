class AddCourseIdToScopes < ActiveRecord::Migration
  def change
    add_column :scopes, :course_id, :integer
  end
end
