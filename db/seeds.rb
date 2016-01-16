# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { name: 'chris', email: 'chris@email.com', password: 'foopasschris' },
  { name: 'ana', email: 'ana@email.com', password: 'foopassiron' },
  { name: 'iron', email: 'iron@email.com', password: 'foopassiron' }
])