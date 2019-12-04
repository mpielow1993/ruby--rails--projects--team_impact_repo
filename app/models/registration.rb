class Registration < ApplicationRecord
  belongs_to :lesson
  belongs_to :subscription
  belongs_to :member
  
  validate :member_lesson_pair_already_exists
  
  before_save :check_subscription_active, :check_subscription_count
  
  def member_lesson_pair_already_exists
    lesson = Lesson.find(self.lesson_id)
    if !Array.wrap(lesson.registrations) != []
      lesson.registrations.each do |registration|
        if registration.member == self.member
          self.errors.add(:base, "You have already registered for this lesson with Subscription '#{registration.subscription.subscription_name}'")
        end
      end
    end
  end
  
  def check_subscription_active
    
    #subscription = Subscription.find(subscription_id)
    
    unless self.subscription.is_active == true
      errors.add(:base, "The subscription used to register for this class must be active")
    end
    
  end

  def check_subscription_count
    
    #subscription = Subscription.find(subscription_id)
    #membership = Membership.find(subscription.membership_id)
    
    if self.subscription.membership.class.name == "FiveClassPass" && self.subscription.registrations.count >= 5
      errors.add(:base, "Registration limit exceeded")
    end
     
    if self.subscription.membership.class.name == "TenClassPass" && self.subscription.registrations.count >= 10
      errors.add(:base, "Registration limit exceeded")
    end
    
  end
    
end
