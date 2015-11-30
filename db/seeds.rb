# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


team = Team.create(
 [
  { name: "Ballers", division: 1},
  { name: "Not", division: 2}
 ]
)


player = Player.create(
 [
  { first: "Baseball", last: "Swaglord", hits: 200, assists: 4, team_id: team[0].id},
  { first: "Isaac", last: "Beadle Ramirez", hits: 500, assists: 10, team_id: team[0].id},
  { first: "Joey", last:"Shelton", hits: 0, assists: 1,  team_id: team[1].id},
  { first: "Johnny", last:"Not-so-turbo", hits: 1, assists: 3,  team_id: team[1].id},
  { first: "Kendra", last: "Kuivenhoven", hits: 2, assists: 1, team_id: team[1].id}
 ]
)


User.create!(name: "Example User", 
             email: "example@railstutorial.org", 
             password: "foobar", 
             password_confirmation: "foobar", 
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)
#note: above makes the first user an admin by default

60.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, 
               email: email, 
               password: password, 
               password_confirmation: password, 
               activated: true, 
               activated_at: Time.zone.now)
end
