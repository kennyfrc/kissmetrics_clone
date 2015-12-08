# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
    user = User.new(
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
      )
    user.skip_confirmation!
    user.save!
end
users = User.all

u = User.new(
   email:    'admin@example.com',
   password: 'helloworld',
 )
u.skip_confirmation!
u.save!


10.times do
  RegisteredApplication.create!(
    name: Faker::Business.credit_card_type,
    url: Faker::Internet.url,
    user: users.sample
  )
end
registered_applications = RegisteredApplication.all


100.times do 
  e = Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Commerce.color
  )
  e.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
end

events = Event.all

puts "Seeding done"
puts "#{RegisteredApplication.count} applications registered."
puts "#{Event.count} events generated."
puts "#{User.count} users generated."