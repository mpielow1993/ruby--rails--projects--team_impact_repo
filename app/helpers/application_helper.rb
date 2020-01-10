module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = "")
    base_title = "Team Impact MMA Ennis"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end


  # Returns the order corresponding to the id of the order stored in the browser session. If this is null, the value of this is set to a new order
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  #Returns the the lesson_date stored in the browser session
  def current_lesson_date
    if !session[:lesson_date].nil?
      return session[:lesson_date]
    else
      return Date.current
    end
  end

  def replace_char(string, char_before, char_after)
    string.gsub "#{char_before}", "#{char_after}"
  end

  def separate_and_titleize(string, char)
    array = string.split(char)
    output_string = ""
    array.each do |element|
      element.titleize
      unless element == array.last
        output_string += element + " "
      else
        output_string += element
      end
    end
    return output_string
  end

end
