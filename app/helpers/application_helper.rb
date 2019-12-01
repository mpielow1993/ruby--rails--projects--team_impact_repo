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
        if !(session[:order_id]).nil?
            Order.find(session[:order_id])
        else
            Order.new
        end
        rescue ActiveRecord::RecordNotFound
            Order.new
    end
    
    #Returns the the lesson_date stored in the browser session
    
    def current_lesson_date
        if !session[:lesson_date].nil?
            return session[:lesson_date]
        else
            return Date.current
        end
    end

    def current_subscription
        if !session[:subscription_id].nil?
            return current_member.subscriptions.find(session[:subscription_id])
        else
            return current_member.subscriptions.first
        end  
    end
    
    def replace_char(string, char_before, char_after)
        string.gsub "#{char_before}", "#{char_after}"
    end
end
