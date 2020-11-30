require 'carrierwave/orm/activerecord'

class StoreItem < ApplicationRecord

    has_many :orders, through: :order_items
    has_many :order_items, dependent: :destroy

    attr_accessor :avatar
    mount_uploader :avatar, ImageUploader

    VALID_TYPES = ["Membership", "NonMembership"]

    validates :type, inclusion: { in: VALID_TYPES }

    #Returns the alt attribute name for an avatar associated with this object instance
    def self.image_alt_attribute_name
      "#{name}"
    end

end
