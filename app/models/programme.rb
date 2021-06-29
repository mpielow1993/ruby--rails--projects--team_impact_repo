require 'carrierwave/orm/activerecord'

class Programme < ApplicationRecord

    has_many :lessons

    attr_accessor :programme_avatar
    mount_uploader :programme_avatar, ImageUploader

    VALID_PROGRAMME_QUOTATION_REGEX = /\A([a-zA-Z0-9[.,'\s]]\s*-*\s*[a-zA-Z0-9[.'\s]]*)+\Z/

    validates :name, presence: true,
                     length: { maximum: 40 }
    validates :programme_quotation, length: { maximum: 300 }
    validate :check_programme_quotation_validity

    #Returns the alt attribute name for an avatar associated with this object instance
    def image_alt_attribute_name
      return "#{self.name}"
    end

    private

      def check_programme_quotation_validity
        if !self.programme_quotation.nil? && !self.programme_quotation.match(VALID_PROGRAMME_QUOTATION_REGEX)
          self.errors.add(:base, "Quotation contains invalid characters")
        end
      end

end
