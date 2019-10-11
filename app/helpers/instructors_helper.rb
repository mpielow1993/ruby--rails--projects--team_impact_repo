module InstructorsHelper
    def gravatar_for_lesson_instructor(instructor, options = { size: 80 })
        #gravatar_id = Digest::MD5::hexdigest(instructor.user_name) 
        #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        #default_image_url = "TIFavicon2.jpg"
        image_tag("instructors_images/#{instructor.first_name}_#{instructor.last_name}.jpg", alt: instructor.first_name + " " + instructor.last_name, size: 80)
    end
end
