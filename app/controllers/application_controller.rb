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
end
