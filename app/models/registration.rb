class Registration < ApplicationRecord
  belongs_to :member
  belongs_to :class
end
