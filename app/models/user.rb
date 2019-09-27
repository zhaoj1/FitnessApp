class User < ApplicationRecord

    has_many :workouts
    has_many :exercises, through: :workouts
    has_many :moods
    has_many :sleeps
    has_many :diets
    belongs_to :charity

    # validates :username, presence: true
    # validates :password, presence: true
    # validates :name, presence: true
    # validates :username, uniqueness: true



end
