class Workout < ApplicationRecord

    has_many :musics
    belongs_to :user

end
