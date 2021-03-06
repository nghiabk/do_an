class Fee < ActiveRecord::Base
  # require 'iconv'
  # require 'csv'
  belongs_to :user

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |fee|
        csv << fee.attributes.values_at(*column_names)
      end
    end
  end

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     fee = find_by_id(row["id"]) || new
  #     fee.attributes = row.to_hash.slice(*accessible_attributes)
  #     fee.save!
  #   end
  # end

  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then Csv.new(file.path, nil, :ignore)
  #   when ".xls" then Roo:Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end

  # def self.import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     Fee.create! row.to_hash
  #   end
  # end

end
