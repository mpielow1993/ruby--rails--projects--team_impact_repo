module FacilitiesHelper
    def avatar_for(facility)
        image_uploader = ImageUploader.new
        if facility.facility_avatar?
            image_tag("#{facility.facility_avatar.thumb}", alt: facility.name)
        else
            image_tag(image_uploader.default_url, alt: facility.name, size: 80)
        end
    end
    
    def facility_big_image_for(facility)
        image_uploader = ImageUploader.new
        if facility.facility_avatar?
            image_tag("#{facility.facility_avatar}", alt: facility.name, width: "60%", height: "800vh")
        else
            image_tag(image_uploader.default_url, alt: facility.name, width: "60%", height: "800vh")
        end        
    end
end
