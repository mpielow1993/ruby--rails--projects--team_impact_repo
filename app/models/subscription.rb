class Subscription < ApplicationRecord
  belongs_to :membership
  belongs_to :member
  
  has_many :registrations, dependent: :destroy
  
  before_save :set_subscription_name
  
  validates :membership_id, presence: true
  validates :member_id, presence: true
  
  validate :check_is_active
  #validates_uniqueness_of :membership_id, scope: :member_id
  
  
  private
  
    def check_is_active
      return false unless expiry_date.nil?
    end
    
    #implement the registrations count in a before_save in the subscriptions controller
    
    #Re-label's the name of the subscription's associated membership if a member already has the same kind
    
    def set_subscription_name
      
      self.subscription_name = self.membership.name
      
      if !member.subscriptions.nil?
        subscription_membership_name_array = []
        name_counter = 1
      
        #Create an array of membership names of all subscriptions
        self.member.subscriptions.each do |subscription|
          subscription_membership_name_array.push(subscription.membership.name)
        end
      
        #Compare the current subscription name against the array of membership names
        subscription_membership_name_array.each do |subscription_membership_name|  
            if self.subscription_name == subscription_membership_name
              name_counter += 1
            end
          end
          
          if name_counter > 1
            self.subscription_name = self.membership.name + " - " + name_counter.to_s
          end
      end
    end
    
end
