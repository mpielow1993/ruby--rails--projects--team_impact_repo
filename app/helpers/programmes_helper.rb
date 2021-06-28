module ProgrammesHelper
    def downcase_name(name)
        name.downcase
    end

    def programme_avatar_for(programme, width: "100%", height: "auto" )
        image_uploader = ImageUploader.new
        if programme.programme_avatar?
            image_tag("#{programme.programme_avatar.thumb}", alt: programme.name, width: width, height: width )
        else
            image_tag(image_uploader.default_url, alt: programme.name, width: width, height: width )
        end
    end
    
    def programme_big_image_for(programme, width: "100%", height: "auto")
        image_uploader = ImageUploader.new
        if programme.programme_avatar?
            image_tag("#{programme.programme_avatar}", alt: programme.name, width: width, height: width )
        else
            image_tag(image_uploader.default_url, alt: programme.name, width: width, height: width )
        end        
    end
end
