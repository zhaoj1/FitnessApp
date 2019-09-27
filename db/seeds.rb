# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Charity.destroy_all
# User.destroy_all
# Mood.destroy_all
# Workout.destroy_all
# Sleep.destroy_all
# Diet.destroy_all
# Exercise.destroy_all

ch1 = Charity.create(charity_name: 'Rain Forest Trust')
ch2 = Charity.create(charity_name: 'Clinton Foundation')
ch3 = Charity.create(charity_name: 'Save the Children')

user1 = User.create(username: "user1", password: "password1", name: "name1", age: 23, weight: 160, charity_id: 1)
user2 = User.create(username: "user2", password: "password2", name: "name2", age: 35, weight: 120, charity_id: 2)
user3 = User.create(username: "user3", password: "password3", name: "name3", age: 62, weight: 110, charity_id: 3)
user4 = User.create(username: "user4", password: "password4", name: "name4", age: 1, weight: 200, charity_id: 4)

d1 = Diet.create(meal: 'chicken', user_id: user1.id )
d2 = Diet.create(meal: 'not chicken', user_id: user1.id )
d3 = Diet.create(meal: 'beef', user_id: user2.id )
d4 = Diet.create(meal: 'pork', user_id: user3.id )
d5 = Diet.create(meal: 'protein', user_id: user4.id )

m1 = Mood.create(mood_kind: 'happy', user_id: user1.id)
m2 = Mood.create(mood_kind: 'not happy', user_id: user2.id)
m3 = Mood.create(mood_kind: 'kinda happy', user_id: user3.id)
m4 = Mood.create(mood_kind: 'really happy', user_id: user4.id)

s1 = Sleep.create(hours: 1, user_id: user1.id)
s2 = Sleep.create(hours: 2, user_id: user2.id)
s3 = Sleep.create(hours: 3, user_id: user3.id)
s4 = Sleep.create(hours: 4, user_id: user4.id)

work1 = Workout.create(name: "workout1", length: 1, user_id: user1.id)
work2 = Workout.create(name: "workout2", length: 2, user_id: user2.id)
work3 = Workout.create(name: "workout3", length: 3, user_id: user3.id)
work4 = Workout.create(name: "workout4", length: 2, user_id: user4.id)

exercise1 = Exercise.create(name: "exercise1", muscle: "biceps", equipment: "none", difficulty: "fricken hard")
exercise2 = Exercise.create(name: "exercise2", muscle: "thighs", equipment: "some", difficulty: "cake")
exercise3 = Exercise.create(name: "exercise3", muscle: "forearms", equipment: "one", difficulty: "so-so")
exercise4 = Exercise.create(name: "exercise4", muscle: "core", equipment: "a lot", difficulty: "good")