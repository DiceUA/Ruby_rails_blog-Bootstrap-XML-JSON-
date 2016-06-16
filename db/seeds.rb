# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all

User.create(
        fullname: 'Nyanta The Cat',
        username: 'nyaka',
        email: 'nyanta@example.com',
        password: 'fishy'
)

User.create(
        fullname: 'Gerrard',
        username: 'gerrard',
        email: 'gerrard@example.com',
        password: 'butler'
)
