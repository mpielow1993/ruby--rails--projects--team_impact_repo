require 'carrierwave/orm/activerecord'

class StoreItem < ApplicationRecord

    has_many :orders, through: :order_items
    has_many :order_items, dependent: :destroy

    attr_accessor :store_item_avatar
    mount_uploader :store_item_avatar, ImageUploader

    VALID_TYPES = ["Membership", "NonMembership"]

    validates :type, inclusion: { in: VALID_TYPES }

    #Returns the alt attribute name for an avatar associated with this object instance
    def image_alt_attribute_name
      return "#{self.name}"
    end

end
