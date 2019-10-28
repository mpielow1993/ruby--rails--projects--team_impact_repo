class StaticPagesController < ApplicationController
  before_action :logged_in_member, only: [:newswire, :public_timetable, :search_public_timetable]
  def home
    #@newswire_post = current_member.newswire_posts.build if current_member.admin?
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
  
  #Newswire posts viewable by all members in the public newswire
  def newswire
        
    @newswire_posts = NewswirePost.all.paginate(page: params[:page])
    @member = current_member
        
    #@newswire_post defined to allow the current logged in user to create a new micropost
    @newswire_post = @member.newswire_posts.build
  end
  
end
