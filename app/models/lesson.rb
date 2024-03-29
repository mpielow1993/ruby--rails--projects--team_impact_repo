class Lesson < ApplicationRecord
  #'validates_timeliness' gem provides many of the following validation configurations relating to the 'start_time' and 'end_time' attributes
  require 'validates_timeliness'
  
  belongs_to :instructor
  belongs_to :facility
  belongs_to :programme
  has_many :registrations, dependent: :destroy
  has_many :subscriptions, through: :registrations
  has_many :members, through: :registrations
  
  default_scope -> { order(start_time: :asc) } #Look up default scopes and how they relate to search and pagination
  
  #VALIDATIONS
  
  #Set in accordance with the following:
  #The gym is open from 6:00 am to 10:00 pm.
  #For convenience and flexibility, classes are set to 1-hour slots in the timetable
  #Each class starts and finishes at at "[hour] o'clock"
  
  #Custom validation methods (see below)
  validate :correct_end_time, :check_lesson_wrt_date_start_time_and_facility
  
  validates :start_time, presence: true
  #Checks that only a start_time with a value of at least 24 hours more than the current_time (i.e lesson creation time) can be entered
  validates_date :date, presence: true, on_or_after: :tomorrow, on_or_after_message: "must be at least 1 day in advance from current date"
  
  #Range of allowable start_time values
  validates_time :start_time, on_or_after: Time.zone.parse("6:00am"), on_or_after_message: 'must be after opening time',
                              on_or_before: Time.zone.parse("9:00pm"), before_message: 'must be at least 1 hour before closing time'
  
  #Range of allowable end_time values
  validates :end_time, presence: true
  validates_time :end_time, on_or_after: Time.zone.parse("7:00am"), on_or_after_message: 'must be at least 1 hour after opening time',
                            on_or_before: Time.zone.parse("10:00pm"), before_message: 'must be before closing time'
  
  VALID_LEVELS = ["Beginner", "Intermediate", "Advanced", "Competition"]
                            
  validates :level, presence: true, inclusion: { in: VALID_LEVELS }
  
  validates :instructor_id, :facility_id, :programme_id, presence: true
  
  before_save :match_times_to_date
  
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
    
    #Checks that one lesson cannot have the same facility as another lesson, if both lesson instances have the same date and start time
    def check_lesson_wrt_date_start_time_and_facility
        Lesson.all.each do |lesson|
          unless lesson == self
            if ((self.date == lesson.date) && (self.start_time == lesson.start_time) && (self.facility_id == lesson.facility_id))
              errors.add(:base, "Lesson with id = '#{lesson.id}' has the same Start Time, Date and Facility") 
            end
          end
        end
    end
    
    def match_times_to_date
      self.start_time = DateTime.parse(self.date.to_s + " " + self.start_time.hour.to_s)
      self.end_time = DateTime.parse(self.date.to_s + " " + self.end_time.hour.to_s)
    end
    
    def self.check_expiry
      self.all.each do |lesson|
        lesson.is_expired = true if DateTime.now >= lesson.end_time
      end
    end
    
end
