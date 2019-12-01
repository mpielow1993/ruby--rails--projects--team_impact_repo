require 'carrierwave/orm/activerecord'

class Member < ApplicationRecord

    attr_accessor :remember_token, :activation_token, :reset_token, :member_avatar 
    mount_uploader :member_avatar, ImageUploader
    #Ensuring that a member's newswire posts are destroyed along with the member
    has_many :newswire_posts, dependent: :destroy
    has_many :comments, through: :newswire_posts, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
    has_many :memberships, -> { where(type: "Membership") }, through: :subscriptions#, class_name: "StoreItem", source: :store_item
    has_many :registrations, through: :subscriptions, dependent: :destroy
    has_many :lessons, through: :registrations
    
    #'before_save' callback downcases all user_names before saving to the DB
    #i.e if one new user enters 'Username' and afterwards another user enters 'userNaME', 
    #they will be the same in the DB
    #In doing so, the second username will be rejected as it violates the uniqueness condition
    
    #before_save { self.user_name = user_name.downcase }
    #before_save { user_name.downcase! }
 
    #Adding account activations to the member model
    
    before_create :create_activation_digest

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
                            confirmation: true,
                            #length: { maximum: 40 },
                            format: { with: VALID_PASSWORD_REGEX },
                            allow_nil: true
                            
    #default validations set to false to permit format
    has_secure_password :password, validations: false
    
    
    
    class << self
        # Returns the hash digest of the given string. 
        def digest(string) 
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost) 
        end
    
        # Returns a random token. 
        def new_token 
            SecureRandom.urlsafe_base64 
        end
    end
    
    def remember
        self.remember_token = Member.new_token
        update_attribute(:remember_digest, Member.digest(self.remember_token))
    end
    
    # Returns true if the given token matches the digest. 
    #def authenticated?(remember_token) 
        #return false if remember_digest.nil?
        #BCrypt::Password.new(remember_digest).is_password?(remember_token) 
    #end
    
    #A generalised 'authenticated?' method
    
    # Returns true if the given token matches the digest. 
    def authenticated?(attribute, token) 
        digest = send("#{attribute}_digest") 
        return false if digest.nil? 
        BCrypt::Password.new(digest).is_password?(token) 
    end
    
    # Forgets a user. 
    def forget 
        update_attribute(:remember_digest, nil) 
    end
    
    #Adding member activation methods to the member model
    
    #Activates an account. 
    def activate 
        update_columns(activated: true, activated_at: Time.zone.now)
    end 
    
    #Sends activation email. 
    def send_activation_email 
        MemberMailer.account_activation(self).deliver_now 
    end
    
    # Returns true if a password reset has expired. 
    def password_reset_expired? 
        reset_sent_at < 2.hours.ago 
    end
    
    #Adding password reset methods to the Member model
    
    # Sets the password reset attributes. 
    def create_reset_digest 
        self.reset_token = Member.new_token 
        update_columns(reset_digest: Member.digest(reset_token), reset_sent_at: Time.zone.now)
    end 
    
    # Sends password reset email. 
    def send_password_reset_email 
        MemberMailer.password_reset(self).deliver_now 
    end
    
    #If a specific member(with a specific member) is registered for a specific class, returns true along with the subscription used to register for it.
    #If said member is not registered, returns false
    
    def is_registered_and_subscription_used(lesson)
        counter = 0
        name = ""
        array = []
        lesson.registrations.each do |registration|
            if registration.member.id == self.id
                name += registration.subscription.subscription_name
                counter += 1
            end
        end
        if counter > 0
            array.push(true, name)
            return array
        else
            return false
        end
    end   
    
    def already_registered_to(lesson)
        counter = 0
        self.registrations.each do |registration|
            if registration.lesson_id == lesson.id
                counter += 1
            end
        end
        counter > 0 ? true : false
    end
    
    def subscription_used_to_register_for(lesson)
        if self.already_registered_to(lesson) == true
           lesson.registrations.each do |registration|
                self.subscriptions.each do |subscription|
                    if registration.subscription == subscription
                        return subscription
                    end
                end
            end
        end
    end
    
    private
    
        # Creates and assigns the activation token and digest. 
        def create_activation_digest 
            self.activation_token = Member.new_token 
            self.activation_digest = Member.digest(activation_token) 
        end
end