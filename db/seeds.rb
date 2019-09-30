# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Charity.destroy_all
# User.destroy_all
# Workout.destroy_all
# Sleep.destroy_all
# Diet.destroy_all
# Exercise.destroy_all

user1 = User.create(username: "user1", password_digest: BCrypt::Password.create("password1"), name: "name1", age: 23, weight: 160)
user2 = User.create(username: "user2", password_digest: BCrypt::Password.create("password2"), name: "name2", age: 35, weight: 120)
user3 = User.create(username: "user3", password_digest: BCrypt::Password.create("password3"), name: "name3", age: 62, weight: 110)
user4 = User.create(username: "user4", password_digest: BCrypt::Password.create("password4"), name: "name4", age: 1, weight: 200)

date1 = DateOf.create(date_of: Date.current, user_id: user1.id)
date2 = DateOf.create(date_of: Date.current, user_id: user2.id)
date3 = DateOf.create(date_of: Date.current, user_id: user3.id)
date4 = DateOf.create(date_of: Date.current, user_id: user4.id)

d1 = Diet.create(meal: 'chicken', date_of_id: date1.id)
d2 = Diet.create(meal: 'not chicken', date_of_id: date2.id)
d3 = Diet.create(meal: 'beef', date_of_id: date3.id)
d4 = Diet.create(meal: 'pork', date_of_id: date4.id)
d5 = Diet.create(meal: 'protein', date_of_id: date1.id)

s1 = Sleep.create(hours: 1, date_of_id: date1.id)
s2 = Sleep.create(hours: 2, date_of_id: date2.id)
s3 = Sleep.create(hours: 3, date_of_id: date3.id)
s4 = Sleep.create(hours: 4, date_of_id: date4.id)

work1 = Workout.create(name: "workout1", length: 1, date_of_id: date1.id)
work2 = Workout.create(name: "workout2", length: 2, date_of_id: date2.id)
work3 = Workout.create(name: "workout3", length: 3, date_of_id: date3.id)
work4 = Workout.create(name: "workout4", length: 2, date_of_id: date4.id)

exercise1 = Exercise.create(name: "exercise1", muscle: "biceps", equipment: "none", difficulty: "fricken hard")
exercise2 = Exercise.create(name: "exercise2", muscle: "thighs", equipment: "some", difficulty: "cake")
exercise3 = Exercise.create(name: "exercise3", muscle: "forearms", equipment: "one", difficulty: "so-so")
exercise4 = Exercise.create(name: "exercise4", muscle: "core", equipment: "a lot", difficulty: "good")