class User < ApplicationRecord

    # has_secure_password
    
    has_many :date_ofs
    has_many :workouts, through: :date_ofs
    has_many :exercises, through: :workouts
    has_many :sleeps, through: :date_ofs
    has_many :diets, through: :date_ofs

    validates :username, presence: true
    validates :password, presence: true
    validates :name, presence: true
    validates :username, uniqueness: true
    validates :age, presence: true
    validates :weight, presence: true
    validates :age, numericality: true
    validates :weight, numericality: true

end
