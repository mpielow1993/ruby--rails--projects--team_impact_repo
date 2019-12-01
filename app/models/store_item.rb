require 'carrierwave/orm/activerecord'

class StoreItem < ApplicationRecord
    
    has_many :orders, through: :order_items
    has_many :order_items, dependent: :destroy
    
    attr_accessor :store_item_avatar 
    mount_uploader :store_item_avatar, ImageUploader
    
    VALID_TYPES = ["Membership", "NonMembership"]
                            
    validates :type, inclusion: { in: VALID_TYPES }

end
