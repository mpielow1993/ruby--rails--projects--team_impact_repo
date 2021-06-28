module CommentsHelper
    def comment_big_image_for(image, width: "100%", height: "auto", style: "border: 0.25em solid #000000")
        image_tag(image, alt: image, width: width, height: height, style: style)
    end
end
