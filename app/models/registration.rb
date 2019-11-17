class Registration < ApplicationRecord
  belongs_to :lesson
  belongs_to :subscription
  
  validates :lesson_date, presence: true
  validate :check_member_is_not_already_registered_for_lesson
  
  def check_member_is_not_already_registered_for_lesson
    lesson_registrations = Registration.where(lesson_id: self.lesson.id)
    if !lesson_registrations.nil?
      lesson_registrations.each do |lesson_registration|
        if lesson_registration.subscription.member == self.subscription.member
          self.errors.add(:base, "You have already registered for this lesson with Subscription '#{lesson_registration.subscription.subscription_name}'")
        end
      end
    end
  end
    
end
