# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  class_attribute :filter_field_hash, default: {}
  class_attribute :filter_field_array, default: []

  before_create :sanitize_text

  before_save :sanitize_text

  def sanitize_text
    attributes.each do |_key, value|
      next unless value.instance_of? String

      # ActiveRecord::Base.connection.quote(value)

      value.inspect
    end
  end

  def self.send_chain(scope_hash = {})
    results = self.all
    if !scope_hash.empty?
      scope_hash.each { |key, value| results = results.send(key, value) }
    end
    return results
  end

  #Generate filter form hash based on the values of a paramter filter _array
  def self.set_filter_field_hash
    if !self.filter_field_array.empty?
      self.filter_field_array.each do |field|
        FORM_FIELD_HASH.each do |key, value|
          if value.include? field
            key_string = "#{key.to_s.downcase.gsub('_attributes', '')}"
            if key_string === 'select'
              if !self.filter_field_hash[key_string].nil?
                if !self.filter_field_hash[key_string].any? do |h|
                     h[key_string] === field
                   end
                  self.filter_field_hash[key_string].push(
                    { 'name': field, 'options': [] },
                  )
                end
              else
                self.filter_field_hash[key_string] = [
                  { 'name': field, 'options': [] },
                ]
              end
              next
            end
            if !self.filter_field_hash[key_string].nil?
              if self.filter_field_hash[key_string].any? do |h|
                   h[key_string] === field
                 end
                self.filter_field_hash[key_string].push(field)
              end
            else
              self.filter_field_hash[key_string] = [field]
            end
          end
        end
      end
    end
    return self.filter_field_hash
  end

  def self.set_filter_field_array(array = [])
    if !array.empty? && array.uniq == array
      self.filter_field_array = array
    end
  end
end
