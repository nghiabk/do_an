class TableScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :score
  belongs_to :activity

  scope :same, ->(user, semester){where user: user, semester: semester}
  
end
