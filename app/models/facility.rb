require 'carrierwave/orm/activerecord'

class Facility < ApplicationRecord

    has_many :lessons

    attr_accessor :avatar
    mount_uploader :avatar, ImageUploader

    validates :name, presence: true

    #Returns the alt attribute name for an avatar associated with this object instance
    def self.image_alt_attribute_name
      "#{name}"
    end
end
