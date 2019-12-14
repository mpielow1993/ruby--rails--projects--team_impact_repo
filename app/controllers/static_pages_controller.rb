class StaticPagesController < ApplicationController

  def home
  end

  def about_us
  end

  def faq_s
  end

  def gym_rules
  end
  
  def contact
    @enquiry = Enquiry.new
  end
  
end
