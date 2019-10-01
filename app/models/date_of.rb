class DateOf < ApplicationRecord
    has_many :sleeps
    has_many :diets
    belongs_to :user
    
end
