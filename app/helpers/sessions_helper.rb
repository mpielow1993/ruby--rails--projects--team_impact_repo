module SessionsHelper
    # Logs in the given member. 
    def log_in(member) 
        session[:member_id] = member.id 
    end
    
    # Remembers a member in a persistent session. 
    def remember(member) 
        member.remember 
        cookies.permanent.signed[:member_id] = member.id 
        cookies.permanent[:remember_token] = member.remember_token 
    end
    
    # Returns the member corresponding to the remember token cookie. 
    def current_member 
        if (member_id = session[:member_id]) 
            @current_member ||= Member.find_by(id: member_id) 
        elsif (member_id = cookies.signed[:member_id]) 
            member = Member.find_by(id: member_id) 
            
            #Using the generalised 'authenticated?' method in 'current member'
                if member && member.authenticated?(:remember, cookies[:remember_token])
                log_in member 
                @current_member = member 
            end
        end 
    end
    
    # Returns the current logged-in member (if any). 
    #def current_member 
        #if session[:member_id] 
            #@current_member ||= Member.find_by(id: session[:member_id]) 
        #end 
    #end
    
    #Returns true if the member is logged in, false otherwise
    def logged_in? 
        !current_member.nil? 
    end
    
    # Forgets a persistent session. 
    def forget(member) 
        member.forget 
        cookies.delete(:member_id) 
        cookies.delete(:remember_token) 
    end
    
    # Logs out the current user. 
    def log_out 
        session.delete(:member_id) 
        @current_member = nil 
    end
    
    # Returns true if the given member is the current member. 
    def current_member?(member) 
        member && member == current_member 
    end
    
    #Code to implement friendly-forwarding
    
    # Redirects to stored location (or to the default). 
    def redirect_back_or(default) 
        redirect_to(session[:forwarding_url] || default) 
        session.delete(:forwarding_url) 
    end 
    
    # Stores the URL trying to be accessed. 
    def store_location 
        session[:forwarding_url] = request.original_url if request.get? 
    end
    
    def store_order(order)
        order = current_member.orders.build
        if order.save
            session[:order_id] = order.id
        end
    end
end