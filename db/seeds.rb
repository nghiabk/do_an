def create_admin
  User.create! username: "admin",name: "admin", password: "adminbk", admin: true
end

def create_user
  10.times do |n|
    name = Faker::Name.name
    mssv = 20120001 + n
    username = mssv.to_s
    email = "#{mssv}@student.hust.edu.vn"
    User.create!(username: username, name: name, password: "123456", 
    start_year: '2010-1-1', email: email, faculty_id: 1, class_student_id: 1,
    birth_day: '20-10-1991', admin: "false")
  end
end

def create_discipline
  5.times do |n|
    Discipline.create! user_id: n+1, level: rand(0..3)
  end
end

def create_faculty
  Faculty.create! name: "Cong nghe thong tin"
  Faculty.create! name: "Dien tu vien thong"
  Faculty.create! name: "Co khi"
  Faculty.create! name: "Dien"
  Faculty.create! name: "Tieng anh"
  Faculty.create! name: "Thuc pham"
end

def create_subject
  @faculty = Faculty.all
  @faculty.each_with_index do |faculty, index|
    Subject.create!  faculty_id: faculty.id,name: "toan cao cap-#{index+1}", credit: rand(2..4),
    semester: 20101
  end
end

def create_course
  @faculty = Faculty.all
  @faculty.each do |faculty|
    2.times do |n|
      Course.create! faculty_id: faculty.id, semester: 20101, class_student_id: 1, 
                    max: 120, min:20, address: "D9-201",count: 0, state: true, 
                    subject_id: 1, day: rand(2..7), start_period: 1, end_period: 4
    end
  end
end

def create_class_student
  @faculty = Faculty.all
  @faculty.each do |faculty|
    name = faculty.name 
    5.times do |n|
      ClassStudent.create!(name: name + " " + (n+1).to_s, count: 50, faculty_id: faculty.id,
      specialized: name, address: "Nga tu so", semester: 20101 ,start_year: "2010", end_year: "2015")
    end
  end 
end

def create_program
  20.times do
    Program.create semester: 20101, subject_id: rand(1..6), class_student_id: rand(1..30)
  end
end

# 10.times do |n|
#   Product.create name: "abc", released_on: "cbd", price: n+10
# end


# create_admin
# create_user
# create_discipline
# create_faculty
# create_subject
# create_class_student
# create_course
create_program