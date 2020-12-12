# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  @@filter_field_hash = {}

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
      scope_hash.each {|key, value| results = results.send(key, value)}
    end
    return results
  end

  def self.get_filter_field_hash
    @@filter_field_hash
  end

  #Generate filter form hash based on the values of a paramter filter _array
  def self.set_filter_field_hash(field_array)
    field_array.each do |field|
      FORM_FIELD_HASH.each do |key, value|
        if value.include? field
          key_string = "#{key.to_s.downcase.gsub('_attributes', '')}"
          if key_string === 'select'
            if !self.get_filter_field_hash[key_string].nil?
              self.get_filter_field_hash[key_string].push({'name': field, 'options': []})
            else
              self.get_filter_field_hash[key_string] = [{'name': field, 'options': []}] 
            end
            next          
          end
          if !self.get_filter_field_hash[key_string].nil?
            self.get_filter_field_hash[key_string].push(field)
          else
            self.get_filter_field_hash[key_string] = [field]
          end
        end
      end
    end
    return self.get_filter_field_hash
  end


end
