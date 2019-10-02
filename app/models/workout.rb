class Workout < ApplicationRecord

    serialize :exercises_array, Array 
    #JSON that looks like an array but is a string

    belongs_to :user
    has_and_belongs_to_many :exercises

end
