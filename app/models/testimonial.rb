class Testimonial < ApplicationRecord
    validates :first_name, :last_name, presence: true
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email,       presence: true, 
                            length: { maximum: 200 }, 
                            format: { with: VALID_EMAIL_REGEX }
                            #Matches either a valid phone number OR an empty string (phone number is optional)
    validates :content,     presence: true,
                            length: { maximum: 300 }
end
