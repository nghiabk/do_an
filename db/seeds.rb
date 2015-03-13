50.times do |n|
    name = Faker::Name.name
    shsv = 20100001 + n
    email = "#{shsv}@student.hust.edu.vn"
    User.create!(shsv: shsv, name: name, password: "123456", 
    start_date: '2010-1-1', email: email, kv_id: 20101,lop_sv_id: n,birth_day: '20-10-1991', admin: "false")
end