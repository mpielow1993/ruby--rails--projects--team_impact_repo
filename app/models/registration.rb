class Registration < ApplicationRecord
  belongs_to :member
  belongs_to :lesson
  
  validate :check_lesson_date_matches_date
  
  def expired?
      if Date.current > lesson_date
        return true
      else
        return false
      end
  end
  
  private
    
    #Check that the date in the registration matches the date in the associated Lesson (although duplicated date this is needed for searching)
    
    def check_lesson_date_matches_date
      unless lesson_date == Lesson.find_by(id: lesson_id).date
        errors.add(:base, "Registration date must match the Lesson Date")
      end
    end
    
    #Method that parses the date string entered in the timeable
    def self.search(search)
      #if search.nil?
        #redirect_to lessons_path
      #end
      if search
        lesson_date = Registration.where(lesson_date: search)
      end
    end

end
