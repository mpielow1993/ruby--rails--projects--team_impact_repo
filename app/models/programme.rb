require 'carrierwave/orm/activerecord'

class Programme < ApplicationRecord
    
    has_many :lessons
    
    attr_accessor :programme_avatar 
    mount_uploader :programme_avatar, ImageUploader
    
    validates :name, presence: true
end
