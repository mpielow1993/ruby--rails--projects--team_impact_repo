

class Lesson < ApplicationRecord
  #'validates_timeliness' gem provides many of the following validation configurations relating to the 'start_time' and 'end_time' attributes
  require 'validates_timeliness'
  
  belongs_to :instructor
  belongs_to :facility
  belongs_to :programme
  has_many :members, through: :registrations
  
  default_scope -> { order(start_time: :asc) } #Look up default scopes and how they relate to search and pagination
  
  #VALIDATIONS
  
  #Set in accordance with the following:
  #The gym is open from 6:00 am to 10:00 pm.
  #For convenience and flexibility, classes are set to 1-hour slots in the timetable
  #Each class starts and finishes at at "[hour] o'clock"
  
  #Custom validation methods (see below)
  validate :check_lesson_time_ending, :correct_end_time
  
  validates :start_time, presence: true
  #Checks that only a start_time with a value of at least 24 hours more than the current_time (i.e lesson creation time) can be entered
  validates_date :date, on_or_after: :tomorrow, on_or_after_message: "Date must be at least 1 day in advance from current date"
  
  #Range of allowable start_time values
  validates_time :start_time, on_or_after: Time.zone.parse("6:00am"), on_or_after_message: 'must be after opening time',
                              on_or_before: Time.zone.parse("9:00pm"), before_message: 'must be at least 1 hour before closing time'
  
  #Range of allowable end_time values
  validates :end_time, presence: true
  validates_time :end_time, on_or_after: Time.zone.parse("7:00am"), on_or_after_message: 'must be at least 1 hour after opening time',
                            on_or_before: Time.zone.parse("10:00pm"), before_message: 'must be before closing time'
  
  VALID_LEVELS = ["Beginner", "Intermediate", "Advanced", "Competition"]
                            
  validates :level, inclusion: { in: VALID_LEVELS }
  
  private 
    
    #Checks that the only start times with a minute reading of ':00' can be saved  
    def check_lesson_time_ending
      unless (start_time.strftime("%H:%M").include? "00")
        errors.add(:start_time, "Start time must end with ':00'")
      end
      unless (end_time.strftime("%H:%M").include? "00")
        errors.add(:end_time, "Finish time must end with ':00'")
      end
    end
    
    #Checks that only end_times with a value of exactly 1 hour after their corresponding start_times can be entered
    def correct_end_time
      unless ((end_time - start_time)/3600 == 1)
        errors.add(:base, "Start Time and End Time must be exactly 1 hour apart")
      end
    end
    
    def self.search(search)
      if search
        Lesson.where(date: search)
      end
    end
    
end
