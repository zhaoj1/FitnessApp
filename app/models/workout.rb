class Workout < ApplicationRecord

    belongs_to :date_of
    has_and_belongs_to_many :exercises

end
