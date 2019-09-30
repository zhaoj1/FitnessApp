class DateOf < ApplicationRecord
    has_many :sleeps
    has_many :diets
    has_many :workouts
    belongs_to :user
end
