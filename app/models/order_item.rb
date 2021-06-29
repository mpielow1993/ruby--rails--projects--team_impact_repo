class OrderItem < ApplicationRecord
  before_save :set_unit_price, :set_sub_total, :set_total
  
  belongs_to :store_item
  belongs_to :order
  
  #validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1  }
  #validates :unit_price, :sub_total, presence: true, numericality: { greater_than_or_equal_to: 0  }
  
  def is_membership?
      return self.store_item.type == "Membership"
  end  
  
  private 
    
    def set_unit_price
      self.unit_price = self.store_item.price.to_d
    end
    
    def set_sub_total
      self.sub_total =  ((self.unit_price) * (self.quantity)).to_d
    end
    
    def set_total
      self.order.update(total: (self.order.total + self.sub_total).to_d)
    end
end
