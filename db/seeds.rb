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

# user1 = User.create(username: "user1", password: "password1", name: "name1", age: 23, weight: 160)
# user2 = User.create(username: "user2", password: "password2", name: "name2", age: 35, weight: 120)
# user3 = User.create(username: "user3", password: "password3", name: "name3", age: 62, weight: 110)
# user4 = User.create(username: "user4", password: "password4", name: "name4", age: 1, weight: 200)

# date1 = DateOf.create(date_of: Date.current.strftime, user_id: user1.id)
# date2 = DateOf.create(date_of: Date.current.strftime, user_id: user2.id)
# date3 = DateOf.create(date_of: Date.current.strftime, user_id: user3.id)
# date4 = DateOf.create(date_of: Date.current.strftime, user_id: user4.id)

# d1 = Diet.create(meal: 'chicken', date_of_id: date1.id)
# d2 = Diet.create(meal: 'not chicken', date_of_id: date2.id)
# d3 = Diet.create(meal: 'beef', date_of_id: date3.id)
# d4 = Diet.create(meal: 'pork', date_of_id: date4.id)
# d5 = Diet.create(meal: 'protein', date_of_id: date1.id)

# s1 = Sleep.create(hours: 1, date_of_id: date1.id)
# s2 = Sleep.create(hours: 2, date_of_id: date2.id)
# s3 = Sleep.create(hours: 3, date_of_id: date3.id)
# s4 = Sleep.create(hours: 4, date_of_id: date4.id)

# work1 = Workout.create(name: "workout1", length: 1, date_of_id: date1.id)
# work2 = Workout.create(name: "workout2", length: 2, date_of_id: date2.id)
# work3 = Workout.create(name: "workout3", length: 3, date_of_id: date3.id)
# work4 = Workout.create(name: "workout4", length: 2, date_of_id: date4.id)

# exercise1 = Exercise.create(name: "exercise1", muscle: "biceps", equipment: "none", difficulty: "fricken hard")
# exercise2 = Exercise.create(name: "exercise2", muscle: "thighs", equipment: "some", difficulty: "cake")
# exercise3 = Exercise.create(name: "exercise3", muscle: "forearms", equipment: "one", difficulty: "so-so")
# exercise4 = Exercise.create(name: "exercise4", muscle: "core", equipment: "a lot", difficulty: "good")

require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper1
    url = 'https://sworkit.com/exercises'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    exercises = Array.new 
    exercise_list = parsed_page.css('div.shadow.card') #452 exercises count (versus #598 as seen on website)
    exercise_list.each do |exercise_listing|
        exercise = { #hash of each exercise
            exercise_name: exercise_listing.css('p').text, #renders name of exercise
            image_url: exercise_listing.css('img')[1].attributes["src"].value, #renders the exercise image url
            page_url: "https://sworkit.com" + exercise_listing.css('a')[0].attributes["href"].value
        }
        exercises << exercise 
    end 
    index = 0 
    exercises.each do |each_exercise|
        ex_unparsed_page = HTTParty.get(each_exercise[:page_url])
        ex_parsed_page = Nokogiri::HTML(ex_unparsed_page)
        exercise_details = ex_parsed_page.css('div.shadow.card.exercise-card')
        exercise = {
            exercise_difficulty: exercise_details.css('p')[0] ? exercise_details.css('p')[0].text : "no information",
            exercise_impact_level: exercise_details.css('p')[1] ? exercise_details.css('p')[1].text : "no information",
            target_body_parts: exercise_details.css('p')[2] ? exercise_details.css('p')[2].text : "no information",
            exercise_video: exercise_details.css('video')[0] ? exercise_details.css('video')[0].attributes['src'].value : "no video",
            category: "Upper Body"
        }
        exercises[index].merge!(exercise) #pushes 4 attributes into array[index] for each exercise
        Exercise.create(exercises[index]) #creates the full exercise & details in the database
        puts "#{index + 1}: creating #{each_exercise[:exercise_name]}"  # puts each_exercise
        index += 1
    end 
    Exercise.category
end 

scraper1
