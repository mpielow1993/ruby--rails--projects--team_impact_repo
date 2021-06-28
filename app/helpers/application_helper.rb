module ApplicationHelper
  #Dependent gems
  require 'rails_autolink'

  # Returns the full title on a per-page basis.
  def full_title(page_title = "")
    base_title = "Team Impact MMA Ennis"
    page_title.empty? ? base_title : base_title + " | " + page_title
  end

  # Returns the order corresponding to the id of the order stored in the browser session. If this is null, the value of this is set to a new order
  def current_order
    !session[:order_id].nil? ? Order.find(session[:order_id]) : Order.new
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

  #Returns a string as space-separated, with the first letter of each word capitalised
  def separate_and_titleize(string)
    string.split.map{|e| e.titleize}.join(" ")
  end

  #Get the member_level of a given members
  def get_member_level(member)
    member.admin? ? "Admin" : "Member"
  end

  #Returns a regex string of a given string
  def make_valid_filename_regex(file_extension_string)
    return /\A([a-aA-z0-9|\-|_]+)(\.)(#{file_extension_string})\z/
  end

  #Generate an image avatar for a given ApplicationRecord object and a set of options/attributes
  def generate_avatar_for(object, parameter_options_hash)
    if object.has_attribute?("avatar")
      image_uploader = ImageUploader.new
      if !parameter_options_hash.empty?
        if !parameter_options_hash[:style].nil? && !parameter_options_hash[:style].empty?
          parameter_options_hash[:style] = parameter_options_hash[:style].map{|k, v| "#{k}:#{v}"}.join(";")
        end
        if !object.avatar.to_s.empty?
          image_tag("#{object.avatar}", parameter_options_hash)
        else
          image_tag(image_uploader.default_url, parameter_options_hash)
        end
      else
        image_tag(image_uploader.default_url, parameter_options_hash)
      end
    end
  end

  #Returns an application record's object description (if it has any)
  def get_description(object)
    if object.has_attribute?("description")
      !object.description.empty? ? object.description : "Description not set"
    else
      "Description not available"
    end
  end

  #If an object has associated content and a trusted site is referenced, automatically
  #generates a link to that site.
  def auto_link_content(object, target = "_blank")
    if object.has_attribute?("content")
      auto_link(sanitize object.content.html_safe, html: { target: target })
    end
  end

end
