class Registration < ApplicationRecord
  belongs_to :lesson
  belongs_to :subscription
end
