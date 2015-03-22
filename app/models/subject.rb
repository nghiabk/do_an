class Subject < ActiveRecord::Base
	has_many :scopes
	has_many :course, dependent: :destroy
	validates :name, :count, :faculty_id, presence: true
	default_scope -> {order(created_at: :desc)}
end
