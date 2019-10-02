class User < ApplicationRecord

    has_secure_password
    
    has_many :date_ofs
    has_many :workouts
    has_many :exercises, through: :workouts

    validates :username, presence: true
    # validates :password, presence: true
    validates :name, presence: true
    validates :username, uniqueness: true
    validates :age, presence: true
    validates :weight, presence: true
    validates :age, numericality: true
    validates :weight, numericality: true

end
