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
    
    def replace_char(string, char_before, char_after)
        string.gsub "#{char_before}", "#{char_after}"
    end
end
