require 'carrierwave/orm/activerecord'

class Member < ApplicationRecord

    self.filter_field_array = self.set_filter_field_array(['user_name', 'first_name', 'last_name', 'phone_no', 'user_level'])
    self.filter_field_hash = self.set_filter_field_hash
    attr_accessor :remember_token, :activation_token, :reset_token, :avatar
    mount_uploader :avatar, ImageUploader

    #Ensuring that a member's newswire posts are destroyed along with the member
    has_many :newswire_posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
    has_many :memberships, -> { where(type: "Membership") }, through: :subscriptions
    has_many :registrations, dependent: :destroy
    has_many :lessons, through: :registrations

    #'before_save' callback downcases all user_names before saving to the DB
    #i.e if one new user enters 'Username' and afterwards another user enters 'userNaME',
    #they will be the same in the DB
    #In doing so, the second username will be rejected as it violates the uniqueness condition

    #before_save { self.user_name = user_name.downcase }
    #before_save { user_name.downcase! }

    #Adding account activations to the member model

    #before_create :set_activation_fields

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])[a-zA-z0-9]{8,40}\Z/
    VALID_USER_NAME_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    VALID_PHONE_NO_REGEX = /\A\+?\d{10,20}\Z/

    validates :user_name,   presence: true,
                            #Used to display specfic error messages
                            length: { minimum: 8, maximum: 200 },
                            format: { with: VALID_USER_NAME_REGEX },
                            uniqueness: true
    validates :first_name,  presence: true,
                            length: { maximum: 40 }
    validates :last_name,   presence: true,
                            length: { maximum: 50 }
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

    #Scopes
    scope :user_name_like, -> (value) {(where("`user_name` LIKE ?", "%#{value}%"))}
    scope :first_name_like, -> (value) {(where("`first_name` LIKE ?", "%#{value}%"))}
    scope :last_name_like, -> (value) {(where("`last_name` LIKE ?", "%#{value}%"))}
    scope :phone_no_like, -> (value) {(where("`phone_no` LIKE ?", "%#{value}%"))}

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
        return digest == token
        #BCrypt::Password.new(digest).is_password?(token)
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

    # Sends account activation email to the email address entered by an admin when creating a new member.
    def send_admin_activation_email
        MemberMailer.admin_account_activation(self).deliver_now
    end

    #Check if a member is already registered to a lesson
    def registered_to?(lesson)
        lesson.members.include?(self)
    end

    #If a member is registered to a lesson, find the subscription they used
    def get_subscription_used_to_register_for(lesson)
        if self.registered_to?(lesson)
           return lesson.registrations.reject{|r| r[:member_id] != self.id}.first.subscription
        end
    end

    #Returns the full name of a member
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    
end

