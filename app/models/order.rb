class Order < ApplicationRecord
  belongs_to :member
  
  has_many :store_items, through: :order_items
end
