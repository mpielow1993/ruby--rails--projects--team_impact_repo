class ApplicationRecord < ActiveRecord::Base
  #self.abstract_class = true
  before_create :sanitize_text
  before_save :sanitize_text

  def sanitize_text
    self.attributes.each do |_key, value|
      if value.instance_of? String
        #ActiveRecord::Base.connection.quote(value)
        value = value.inspect
      end
    end
  end

  def self.scope_hash(key)
    operator_array = ["=", ">", "<", "<=", ">="]
    scope_hash = Hash.new
    operator_array.each do |operator|
      scope_hash["with_#{key}_#{operator}"] = "`#{key}` IS NOT NULL AND #{key} #{operator} = ? "
    end
    return scope_hash
  end

  def set_scopes
    scope_hash.each do |key, value|
      scope key, -> { where(value, attribute.value) }
    end
  end

end
