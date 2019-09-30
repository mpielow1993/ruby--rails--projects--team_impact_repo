module MembersHelper
    def gravatar_for(member)
        gravatar_id = Digest::MD5::hexdigest(member.user_name) 
        #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        default_image_url = "TIFavicon2.jpg"
        image_tag(default_image_url, alt: member.user_name, size: 80)
    end
end
