class User < ApplicationRecord

    has_many :workouts
    has_many :musics, through: :workouts
    has_many :moods
    has_many :sleeps
    has_many :diets
    belongs_to :charity

end
