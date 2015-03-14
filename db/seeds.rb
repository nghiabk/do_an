def create_admin
  User.create!( mssv: 2010 ,name: "admin", password: "adminbk",admin: true)
end

def create_user
  50.times do |n|
    name = Faker::Name.name
    mssv = 20100001 + n
    email = "#{mssv}@student.hust.edu.vn"
    User.create!(mssv: mssv, name: name, password: "123456", 
    start_date: '2010-1-1', email: email, faculty_id: 20101, class_id: n,
    birth_day: '20-10-1991', admin: "false")
  end
end

def create_scope
  20.times do |n|
    Scope.create!(semester: 20101, subject_id: 1, count: 3, class_id: 1, middle_scope: 5, 
    end_scope: 4.5, letter: "D", user_id: 2, course_id: 1)
  end
end

create_admin
create_user
create_scope