class Instructor < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :lessons
end
