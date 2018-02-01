# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#User.create!(name: 'David', email: "dvcv92@gmail.com", password: "password")
User.create!(name: 'David', email: "dvcv92@gmail.com", password: "password")


List.create!(title: 'food', private: false, user_id: 1)

Item.create!(title: 'apple', list_id: 1)


User.create!(name: 'Ed', email: "ed92@gmail.com", password: "password")


List.create!(title: 'food', private: false, user_id: 2)

Item.create!(title: 'apple', list_id: 2)
