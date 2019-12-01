module ProgrammesHelper
    def downcase_name(name)
        name.downcase
    end

    def programme_avatar_for(programme)
        image_uploader = ImageUploader.new
        if programme.programme_avatar?
            image_tag("#{programme.programme_avatar.thumb}", alt: programme.name)
        else
            image_tag(image_uploader.default_url, alt: programme.name, size: 80)
        end
    end
    
    def programme_big_image_for(programme)
        image_uploader = ImageUploader.new
        if programme.programme_avatar?
            image_tag("#{programme.programme_avatar}", alt: programme.name, width: "60%", height: "800vh")
        else
            image_tag(image_uploader.default_url, alt: programme.name, width: "60%", height: "800vh")
        end        
    end
end
