module InstructorsHelper
    def avatar_for(instructor)
        image_uploader = ImageUploader.new
        if instructor.instructor_avatar?
            image_tag("#{instructor.instructor_avatar.thumb}", alt: instructor.first_name + " " + instructor.first_name)
        else
            image_tag(image_uploader.default_url, alt: instructor.first_name + " " + instructor.first_name, size: 80)
        end
    end
end

