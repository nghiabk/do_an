class TotalScore < ActiveRecord::Base
  belongs_to :user
  scope :same_user, ->(user){where user: user}
  scope :same, ->(user, semester){where user: user, semester: semester}
end
