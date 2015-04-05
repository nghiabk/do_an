module ApplicationHelper
  def full_title(page_title='')
    base_title = "Ruby on rails"
    if page_title.empty?
      base_title
    else
      "#{page_title}|#{base_title}"
    end
  end

  def display_score number
    arr = {0.0=>"F", 1.0=>"D", 1.5=>"D+", 2.0=>"C", 2.5=>"C+", 3.0=>"B", 3.5=>"B+", 4.0=>"A"}
    arr[number]
  end
end
