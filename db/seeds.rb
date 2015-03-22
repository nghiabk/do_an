def create_admin
  User.create! username: "admin",name: "admin", password: "adminbk", admin: true
end

def create_user
  5.times do |n|
    name = Faker::Name.name
    mssv = 20120001 + n
    username = mssv.to_s
    email = "#{mssv}@student.hust.edu.vn"
    User.create!(username: username, name: name, password: "123456", 
    start_date: '2010-1-1', email: email, faculty_id: 20101, class_student_id: 1,
    birth_day: '20-10-1991', admin: "false")
  end
end

# def create_scope
#   10.times do |n|
#     Scope.create!(semester: 20101, subject_id: rand(1..10), count: 3, class_student_id: 1, middle_scope: 5, 
#     end_scope: 4.5, letter: "D", user_id: 2, course_id: 1)
#   end
# end

# def create_faculty
#   Faculty.create! name: "Cong nghe thong tin"
#   Faculty.create! name: "Dien tu vien thong"
#   Faculty.create! name: "Co khi"
#   Faculty.create! name: "Dien"
# end

# def create_course
#   @faculty = Faculty.all
#   @faculty.each do |faculty|
#     20.times do |n|
#       teacher = Faker::Name.name
#       Course.create!(faculty_id: faculty.id, semester: 20101, student_id: 1, 
#                       max: 120, count: 35, status: true, teacher: teacher, subject_id: 1)
#     end
#   end
# end

# def create_class_student
#   @faculty = Faculty.all
#   @faculty.each do |faculty|
#     name = faculty.name 
#     5.times do |n|
#       ClassStudent.create!(name: name + " " + (n+1).to_s, count: 50, faculty_id: faculty.id,
#       specialized: name, start_year: 2010, end_year: 2015)
#     end
#   end 
# end



create_admin
create_user
# create_scope
# create_faculty
# create_class_student