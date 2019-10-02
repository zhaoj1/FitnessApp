class DateOf < ApplicationRecord
    has_many :sleeps
    has_many :diets
    belongs_to :user
   
    def workouts
        @workout = Workout.where(workout_date: self.date_of)
    end

end
