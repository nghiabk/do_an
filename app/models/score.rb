class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :course
  has_many :table_scores, dependent: :destroy
end
