class DateOf < ApplicationRecord

    belongs_to :user
   
    def workouts
        @workout = Workout.where(workout_date: self.date_of)
    end

end
