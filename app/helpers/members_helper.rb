module MembersHelper
    def avatar_for(member)
        image_uploader = ImageUploader.new
        if member.member_avatar?
            image_tag("#{member.member_avatar.thumb}", alt: member.user_name)
        else
            image_tag(image_uploader.default_url, alt: member.user_name, size: 80)
        end
    end
end
