class Course < ActiveRecord::Base
  has_many :scopes
  has_many :activities, dependent: :destroy
  belongs_to :subject
  belongs_to :faculty
  belongs_to :class_student
  validates :faculty_id, :semester, :class_student_id, :max, :min, :teacher, :subject_id,  presence: true
  default_scope -> {order(created_at: :desc)}
end
