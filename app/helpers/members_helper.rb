module MembersHelper
    def member_avatar_for(member)
        image_uploader = ImageUploader.new
        if member.member_avatar?
            image_tag("#{member.member_avatar.thumb}", alt: member.user_name)
        else
            image_tag(image_uploader.default_url, alt: member.user_name, size: 80)
        end
    end
    
    def member_big_image_for(member, width: "60%", height: "800vh" )
        image_uploader = ImageUploader.new
        if member.member_avatar?
            image_tag("#{member.member_avatar}", alt: member.first_name + " " + member.last_name, width: width, height: height)
        else
            image_tag(image_uploader.default_url, alt: member.first_name + " " + member.last_name, width: width, height: height)
        end        
    end
end
