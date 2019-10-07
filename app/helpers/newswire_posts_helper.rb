module NewswirePostsHelper
    require 'rails_autolink'
    
    def auto_link_content(content)
        auto_link(content, html: { target: "_blank" })
    end
end
