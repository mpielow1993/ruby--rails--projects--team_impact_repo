require 'carrierwave/orm/activerecord'

class Instructor < ApplicationRecord

    has_many :lessons

    attr_accessor :instructor_avatar
    mount_uploader :instructor_avatar, ImageUploader

    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
