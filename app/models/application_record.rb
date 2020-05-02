class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
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

  def admin_search
    sql_query = self.class.all
    operator_array = ["=", "<", ">", "<=", ">="]
    self.attributes.each do |key, value|
      if (params[_key] && !params[_key].nil?)
        if value.instance_of? String
          sql_query.where("`#{key}` LIKE ?", value)
        elsif ((value.instance_of? Integer) || (value.instance_of? Decimal) || (value.instance_of? Date) || (value.instance_of? DateTime))
          operator_array.each do |operator|
            if params[:operator]
              sql_query.where("`#{key}` #{operator} ?", value)
            end
          end
        else
        end
      end
    end
  end

end
