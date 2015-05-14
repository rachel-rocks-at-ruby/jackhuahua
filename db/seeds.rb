require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.first_name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10),
     description: Faker::Lorem.paragraph,
     location: Faker::Address.country
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 # Create Galleries
 20.times do
   gallery = Gallery.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 galleries = Gallery.all

 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!

# Create regular user
 rachel = User.new(
   name:     'Rachel',
   email:    'rachel@example.com',
   password: 'helloworld'
 )
 rachel.skip_confirmation!
 rachel.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Gallery.count} galleries created"