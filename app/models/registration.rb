class Registration < ApplicationRecord
  
  belongs_to :lesson
  belongs_to :subscription
  belongs_to :member
  
  validates :member_id, :lesson_id, :subscription_id, presence: true
  
  validate :member_lesson_pair_already_exists, :check_subscription_active, :check_lesson_not_expired
  before_save :set_class_number_based_passes_expiry_date
  
  private
  
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
        self.subscription.update(expiry_date: DateTime.now)
        self.subscription.update(is_active: false)
    end
    if (self.subscription.membership_id == 3 && self.subscription.registrations.count == 9)
        self.subscription.update(expiry_date: DateTime.now)
        self.subscription.update(is_active: false)
    end
  end 
  
  def check_subscription_active
    errors.add(:base, "The subscription used to register for this class must be active") if self.subscription.is_active == false
  end
  
  def check_lesson_not_expired
    errors.add(:base, "The lesson being registered for has already taken place") if self.lesson.is_expired == true
  end
    
end
