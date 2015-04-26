class Program < ActiveRecord::Base
  belongs_to :class_student
  belongs_to :subject
end
