require 'timeliness'

class Lesson < ApplicationRecord
  belongs_to :instructor
  belongs_to :facility
  belongs_to :programme
  has_many :members, through: :registrations
  
  validates :start_time, :end_time, presence: true
  
  validate :check_lesson_time_ending, :check_lesson_duration
  
  validates_datetime :finish_time, after: :start_time
  
  validates_date :start_time, on: :create, on_or_after: :tomorrow
  
  validates_time :start_time, between: ['6:00am', '9:00pm']
  validates_time :finish_time, between: ['7:00am', '10:00pm']
  
  
  #def check_lesson_time
    
    #Check that the start_time and the end time are exactly 1 hour apart
    #if (end_time.hour - start_time.hour) == 1
      
      #Check that the start_time is between 06:00 and 22:00 (opening and closing times for the gym)
      #if (start_time.hour.to_i >= 6 && end_time.hour.to_i < 22)
      
        #Check that a class
        #if (self.start_time - self.created_at)/3600 > 1
        #else
          #self.errors.add(:start_time, "Start time must be at least 24 hours from lesson creation")
        #end
      #else
        #self.errors.add(:start_time, "Start time must be no earlier than 6am. End time must be no later than 10pm")
      #end
    #else
      #self.errors.add(:start_time, "Start time and End time must be exactly 1 hour apart")
    #end
  #end
  
  def check_lesson_time_ending(start_time, finish_time)
    if !((self.start_time.to_s.include? "00") && (self.finish_time.to_s.include? "00"))
      self.errors.add(:start_time, "Start time must end with ':00'")
      self.errors.add(:finish_time, "Finish time must end with ':00'")
    end
  end
  
  def check_lesson_duration(start_time, finish_time)
    if (self.end_time.hour - self.start_time.hour).to_i < 1
      self.errors.add(:start_time, "Start time must be exactly 1 hour earlier than Finish time")
      self.errors.add(:finish_time, "Finish time must be exactly 1 hour later than Start time")
    end
  end    
  
end
