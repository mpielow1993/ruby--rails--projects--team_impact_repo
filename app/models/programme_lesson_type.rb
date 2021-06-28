class ProgrammeLessonType < ApplicationRecord
  belongs_to :programme
  belongs_to :lesson_type
end
