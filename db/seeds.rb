# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = ['chris', 'ana', 'iron']

users.each do |user|
  user = User.create( name: user, email: user + '@email.com', password: 'foopass' + user )
  Pet.create( name: user.name + 'pet', species: 'dog', age: rand(10), user_id: user.id)
end

