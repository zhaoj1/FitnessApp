class Exercise < ApplicationRecord
    has_and_belongs_to_many :workouts

    def self.category
       Exercise.where(id: (1..84)).update_all(category: "Upper Body")
       Exercise.where(id: (85..171)).update_all(category: "Lower Body")
       Exercise.where(id: (172..231)).update_all(category: "Core")
       Exercise.where(id: (232..240)).update_all(category: "Back")
       Exercise.where(id: (241..293)).update_all(category: "Cardio")
       Exercise.where(id: (294..355)).update_all(category: "Yoga")
       Exercise.where(id: (356..381)).update_all(category: "Pilates")
       Exercise.where(id: (382..452)).update_all(category: "Stretching")
    end 

    def self.upper_body
        Exercise.where(category: "Upper Body")
    end

    def self.lower_body
        Exercise.where(category: "Lower Body")
    end

    def self.core
        Exercise.where(category: "Core")
    end

    def self.back
        Exercise.where(category: "Back")
    end

    def self.cardio
        Exercise.where(category: "Cardio")
    end

    def self.yoga
        Exercise.where(category: "Yoga")
    end

    def self.pilates
        Exercise.where(category: "Pilates")
    end

    def self.stretching
        Exercise.where(category: "Stretching")
    end

    def add_to_workout(workout_id)
        @workout = Workout.find_by(id: workout_id)
        @workout.exercises_array << self
        @workout.save
    end

end
