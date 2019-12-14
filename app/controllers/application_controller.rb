class ApplicationController < ActionController::Base
    include SessionsHelper
    include ApplicationHelper
    
    private
        
    #Before filters
    
    # Confirms a logged-in member. 
    def logged_in_member 
        unless logged_in?
    
        #Adding store_location to the logged-in-user before-ﬁlter
        store_location
        flash[:danger] = "Please log in." 
        redirect_to log_in_url 
        end 
    end
    
    # Confirms the correct member. 
    def correct_member 
        !params[:member_id].nil? ? @member = Member.find(params[:member_id]) : @member = Member.find(params[:id]) 
        redirect_to(root_url) unless current_member?(@member)
    end
    
    # Confirms an admin member. 
    def admin_member 
        redirect_to(root_url) unless current_member.admin? 
    end
    
    #Logs out the user and redirects to the login screen unless
end
