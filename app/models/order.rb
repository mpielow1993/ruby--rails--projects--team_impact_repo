class Order < ApplicationRecord
  attribute :total, :decimal, default: 0
  
  before_save :set_total
  belongs_to :member
  
  has_many :store_items, through: :order_items
  has_many :order_items, dependent: :destroy
  
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0  }
  #validates :is_paid, presence: true, default

    def set_total
        self.total = self.order_items.collect{ |order_item| order_item.valid? ? (order_item.sub_total) : 0 }.sum.to_d
    end
  
  private
    

    
    #def default_values
     # self.total ||= 0
    #end
end
