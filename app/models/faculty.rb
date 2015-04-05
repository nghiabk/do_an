class Faculty < ActiveRecord::Base
  has_many :courses
  has_many :subjects
  validates :name, presence: true, uniqueness: true
  default_scope -> {order(created_at: :desc)}
end
