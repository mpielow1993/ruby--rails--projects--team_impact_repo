class Enquiry < ApplicationRecord
    validates :first_name, :last_name, presence: true

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email,       presence: true, 
                            length: { maximum: 200 }, 
                            format: { with: VALID_EMAIL_REGEX }
                            #Matches either a valid phone number OR an empty string (phone number is optional)
    VALID_PHONE_NO_REGEX = /\A\+?\d{10,20}\Z/        
    validates :phone_no,    format: { with: VALID_PHONE_NO_REGEX }
    
    validates :message,     presence: true,
                            length: { maximum: 300 }
                            
    #Send enquiry submission email
    def send_enquiry
        EnquiryMailer.submit_enquiry(self).deliver_now 
    end
end
