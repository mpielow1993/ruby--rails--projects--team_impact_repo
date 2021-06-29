require 'carrierwave/orm/activerecord'

class Facility < ApplicationRecord

    has_many :lessons

    attr_accessor :facility_avatar
    mount_uploader :facility_avatar, ImageUploader

    validates :name, presence: true

    #Returns the alt attribute name for an avatar associated with this object instance
    def image_alt_attribute_name
      return "#{self.name}"
    end
end
