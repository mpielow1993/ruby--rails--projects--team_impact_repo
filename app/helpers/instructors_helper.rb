module InstructorsHelper
    def instructor_thumb_image_for(instructor)
        image_uploader = ImageUploader.new
        if instructor.instructor_avatar?
            image_tag("#{instructor.instructor_avatar.thumb}", alt: instructor.first_name + " " + instructor.first_name)
        else
            image_tag(image_uploader.default_url, alt: instructor.first_name + " " + instructor.first_name, size: 80)
        end
    end
    
    def instructor_big_image_for(instructor)
        image_uploader = ImageUploader.new
        if instructor.instructor_avatar?
            image_tag("#{instructor.instructor_avatar}", alt: instructor.first_name + " " + instructor.first_name, width: "60%", height: "800vh")
        else
            image_tag(image_uploader.default_url, alt: instructor.first_name + " " + instructor.first_name, width: "60%", height: "800vh")
        end        
    end
end

