class Subscription < ApplicationRecord
  belongs_to :membership
  belongs_to :member
  
  has_many :registrations, dependent: :destroy
  
  before_save :set_subscription_name, :set_registration_limit, :set_time_based_passes_expiry_date
  
  validates :membership_id, presence: true
  validates :member_id, presence: true
  
  #validates_uniqueness_of :membership_id, scope: :member_id
  
  
  private
  
    
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
    
    def set_time_based_passes_expiry_date
      
      if self.membership_id == 1
        self.expiry_date = DateTime.now + 1.day
      end
      if self.membership_id == 4
        self.expiry_date = DateTime.now + 1.month 
      end

    end 
    
    def set_registration_limit
      
      case self.membership_id
        when 2
          self.registration_limit = 5.to_s
        when 3
          self.registration_limit = 10.to_s
      else
        self.registration_limit = "Unlimited"
      end
      
    end
    
    def self.check_expiry_dates
      counter = 0
      self.all.each do |subscription|
        if (!subscription.expiry_date.nil? && (DateTime.current >= subscription.expiry_date))
          subscription.is_active = false
          counter += 1
        end
        return "#{counter} subscriptions deactivated"
      end
    end
    
end
