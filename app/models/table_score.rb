class TableScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :score
  belongs_to :activity

  scope :same, ->(user, semester){where user: user, semester: semester}
  
  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |product|
  			csv << product.attributes.values_at(*column_names)
  		end
  	end
  end
end
