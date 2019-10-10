class Testimonial < ApplicationRecord
    validates :first_name, :last_name, :city, :country, presence: true
     default_scope -> { order(created_at: :desc) }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email,       presence: true, 
                            length: { maximum: 200 }, 
                            format: { with: VALID_EMAIL_REGEX }
                            #Matches either a valid phone number OR an empty string (phone number is optional)
    validates :content,     presence: true,
                            length: { maximum: 300 }
                            
    #Send testimonial submission email
    def send_testimonial
        TestimonialMailer.submit_testimonial(self).deliver_now 
    end
end
