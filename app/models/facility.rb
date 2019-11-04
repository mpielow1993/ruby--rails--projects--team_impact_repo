require 'carrierwave/orm/activerecord'

class Facility < ApplicationRecord
    
    has_many :lessons
    
    attr_accessor :facility_avatar 
    mount_uploader :facility_avatar, ImageUploader
    
    validates :name, presence: true
end
