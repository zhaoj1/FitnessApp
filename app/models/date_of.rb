class DateOf < ApplicationRecord
    has_many :sleeps
    has_many :diets
    belongs_to :user
   
    def workouts
        Workout.where(workout_date: self)
    end


end
