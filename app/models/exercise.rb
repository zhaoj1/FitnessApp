class Exercise < ApplicationRecord
    has_and_belongs_to_many :workouts
end
