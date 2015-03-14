class Scope < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject
	belongs_to :course
end
