module LessonsHelper
    def gravatar_for_lesson_instructor(instructor)
        #gravatar_id = Digest::MD5::hexdigest(member.user_name) 
        #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        #default_image_url = "TIFavicon2.jpg"
        image_tag("instructors_images/#{instructor.first_name}_#{instructor.last_name}.jpg", alt: instructor.first_name + " " + instructor.last_name , size: 120)
    end
end
