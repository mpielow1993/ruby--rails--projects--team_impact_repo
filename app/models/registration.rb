class Registration < ApplicationRecord
  belongs_to :lesson
  belongs_to :subscription
  belongs_to :member
  
  validate :member_lesson_pair_already_exists, :set_class_number_based_passes_expiry_date, :check_registration_count, :check_subscription_active
  
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
  
  def set_class_number_based_passes_expiry_date
    if (self.subscription.membership_id == 2 && self.subscription.registrations.count == 4)
      self.subscription.expiry_date = DateTime.now
      self.subscription.is_active = false
    end
    if (self.subscription.membership_id == 3 && self.subscription.registrations.count == 9)
      self.subscription.expiry_date = DateTime.now
      self.subscription.is_active = false
    end
  end 
  
  def check_registration_count
    if ((self.subscription.membership_id == 2 && self.subscription.registrations.count >= 6) || (self.subscription.membership_id == 3 && self.subscription.registrations.count >= 11))
      self.errors.add(:base, "The registration limit for Subscription '#{self.subscription.subscription_name}' has been reached")
    end
  end
  
  def check_subscription_active

    if self.subscription.is_active != true
      errors.add(:base, "The subscription used to register for this class must be active")
    end
    
  end

end
