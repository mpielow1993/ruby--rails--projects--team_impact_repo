class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_create :sanitize_text
  before_save :sanitize_text

  VALID_IMAGE_FILE_ARRAY = ["jpe?g", "png", "gif"]

  def sanitize_text
    self.attributes.each do |_key, value|
      if value.instance_of? String
        #ActiveRecord::Base.connection.quote(value)
        value.inspect
      end
    end
  end
end
