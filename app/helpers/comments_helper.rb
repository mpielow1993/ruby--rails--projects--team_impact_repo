module CommentsHelper
    require 'rails_autolink'
    
    def auto_link_content(content)
        auto_link(content, html: { target: "_blank" })
    end       
    
    def comment_big_image_for(image, width: "100%", height: "auto", style: "border: 0.25em solid #000000")
        image_tag(image, alt: image, width: width, height: height, style: style)
    end
end
