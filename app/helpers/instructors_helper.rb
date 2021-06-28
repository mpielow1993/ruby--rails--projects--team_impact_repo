module InstructorsHelper
    def instructor_avatar_for(instructor,  width: "100%", height: "auto" )
        image_uploader = ImageUploader.new
        if instructor.instructor_avatar?
            image_tag("#{instructor.instructor_avatar.thumb}", alt: instructor.first_name + " " + instructor.first_name, width: width, height: height )
        else
            image_tag(image_uploader.default_url, alt: instructor.first_name + " " + instructor.first_name, width: width, height: height )
        end
    end
    
    def instructor_big_image_for(instructor, width: "100%", height: "auto" )
        image_uploader = ImageUploader.new
        if instructor.instructor_avatar?
            image_tag("#{instructor.instructor_avatar}", alt: instructor.first_name + " " + instructor.last_name, width: width, height: height)
        else
            image_tag(image_uploader.default_url, alt: instructor.first_name + " " + instructor.last_name, width: width, height: height)
        end        
    end
end

