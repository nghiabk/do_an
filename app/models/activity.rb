class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_one :table_score, dependent: :destroy

  scope :is_repeat, ->(user, course){where user: user, course: course}
  scope :same_time, ->(user, course){where user: user, day: course.day}
  scope :not_again, ->(user, semester){where user: user, semester: semester, again: "f"}
  scope :again, ->(user, semester){where user: user, semester: semester, again: "t"}
end
