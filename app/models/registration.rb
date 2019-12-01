class Registration < ApplicationRecord
  belongs_to :lesson
  belongs_to :subscription
  has_one :member, through: :subscription
  
  validate :member_lesson_pair_already_exists
  
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
    
end
