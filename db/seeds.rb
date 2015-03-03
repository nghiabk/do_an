50.times do |n|
  name = Faker::Name.name
  shsv = 20100001 + n
  User.create!(shsv: shsv, name: name, password: "123456")
end 
