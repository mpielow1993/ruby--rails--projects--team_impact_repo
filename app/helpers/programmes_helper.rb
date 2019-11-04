module ProgrammesHelper
    def downcase_name(name)
        name.downcase
    end

    def avatar_for(facility)
        image_uploader = ImageUploader.new
        if programme.programme_avatar?
            image_tag("#{programme.programme_avatar.thumb}", alt: programme.name)
        else
            image_tag(image_uploader.default_url, alt: programme.name, size: 80)
        end
    end
end
