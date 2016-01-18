# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = ["Chris", "Anna", "Iron"]

users.each do |name|
  puts "creating user #{name}"
  user = User.create( name: name, email: name + "@email.com", password: "foopass" + name )
  puts "creating pet for #{name} with name #{name}Pet"
  Pet.create( name: user.name + "Pet", species: "Dog", age: rand(10), user_id: user.id)
end

