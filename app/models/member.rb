class Member < ApplicationRecord
    
    #'before_save' callback downcases all user_names before saving to the DB
    #i.e if one new user enters 'Username' and afterwards another user enters 'userNaME', 
    #they will be the same in the DB
    #In doing so, the second username will be rejected as it violates the uniqueness condition
    
    #before_save { self.user_name = user_name.downcase }
    #before_save { user_name.downcase! }

    VALID_USER_NAME_REGEX = VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])[a-zA-z0-9]{8,40}\Z/
    validates :user_name,   presence: true, 
                            #Used to display specfic error messages
                            length: { minimum: 8, maximum: 40 },
                            format: { with: VALID_USER_NAME_REGEX },
                            uniqueness: true
    validates :first_name,  presence: true, 
                            length: { maximum: 40 }
    validates :last_name,   presence: true, 
                            length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email,       presence: true, 
                            length: { maximum: 200 }, 
                            format: { with: VALID_EMAIL_REGEX }
    VALID_PHONE_NO_REGEX = /\A\+?\d{10,20}\Z/
    validates :phone_no,    presence: true, 
                            #length: { maximum: 20 },
                            format: { with: VALID_PHONE_NO_REGEX }
    
    validates :password,    presence: true,
                            #length: { maximum: 40 },
                            format: { with: VALID_PASSWORD_REGEX }
    #default validations set to false to permit format
    has_secure_password :password, validations: false
    
# Returns the hash digest of the given string. 
    def Member.digest(string) 
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost) 
    end
end
