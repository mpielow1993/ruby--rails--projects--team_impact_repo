class OrderItem < ApplicationRecord
  belongs_to :store_item
  belongs_to :order
end
