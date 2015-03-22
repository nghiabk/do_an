class ClassStudent < ActiveRecord::Base
  belongs_to :faculty
  has_many :courses, dependent: :destroy
  has_many :users
  validates :faculty_id, :name, :specialized, :count, :start_year, :end_year, presence: true
  validates :name, uniqueness: true
  default_scope -> {order(created_at: :desc)}
end
