class Subscription < ApplicationRecord
  belongs_to :membership
  belongs_to :member
  
  has_many :registrations
  
  validate :check_is_active
  
  private
  
    def check_is_active
      return false unless expiry_date.nil?
    end
    
    #implement the registrations count in a before_save in the subscriptions controller
end
