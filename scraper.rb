require 'nokogiri'
require 'httparty'
require 'byebug'

# require_relative './app/models/exercise.rb'

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
            exercise_video: exercise_details.css('video')[0].attributes['src'].value
        }
        exercises[index].merge!(exercise)
        # byebug
        Exercise.create(exercises[index])
        # puts each_exercise
        puts "creating #{each_exercise[:exercise_name]}"
        index += 1
        # byebug
    end 
    byebug 
end 

scraper1 









