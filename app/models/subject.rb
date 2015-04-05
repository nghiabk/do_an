class Subject < ActiveRecord::Base
  has_many :scores, dependent: :destroy
  has_many :course, dependent: :destroy
  belongs_to :faculty
  validates :name, :credit, :faculty_id, presence: true
  default_scope -> {order(created_at: :desc)}
end
