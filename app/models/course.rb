class Course < ActiveRecord::Base

  with_options dependent: :destroy do |assoc|
    assoc.has_many :scores
    assoc.has_many :activities
  end
  belongs_to :subject
  belongs_to :faculty
  belongs_to :class_student
 
  # validates :faculty_id, :semester, :class_student_id,
            # :max, :min, :teacher, :subject_id,  presence: true
  
  default_scope -> {order(created_at: :desc)}
  
  def is_max?
  	self.count == self.max
  end
end
