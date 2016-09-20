# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Admin User", email: "admin@user.com", password: "adminpassword", password_confirmation: "adminpassword", 
             admin: true, activated: true, activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@user.com"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

# take the first 6 users
users = User.order(:created_at).take(6)
#.first(6) also works instead of .take(6)

50.times do
  # lets user the faker gem to create a lorem ipsum sentence of length 5
  content = Faker::Lorem.sentence(5)
  users.each {|user| user.microposts.create!(content: content)}
end
