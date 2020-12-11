# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_create :sanitize_text

  before_save :sanitize_text

  def sanitize_text
    attributes.each do |_key, value|
      next unless value.instance_of? String

      # ActiveRecord::Base.connection.quote(value)

      value.inspect
    end
  end

  def self.send_chain(scope_list)
    scope_list.empty? self.all ? scope_list.inject(self, :send)
  end
end
