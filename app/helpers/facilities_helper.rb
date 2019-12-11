module FacilitiesHelper
    def avatar_for(facility, width: "100%", height: "auto")
        image_uploader = ImageUploader.new
        if facility.facility_avatar?
            image_tag("#{facility.facility_avatar.thumb}", alt: facility.name, width: width, height: width )
        else
            image_tag(image_uploader.default_url, alt: facility.name, width: width, height: width )
        end
    end
    
    def facility_big_image_for(facility, width: "100%", height: "auto")
        image_uploader = ImageUploader.new
        if facility.facility_avatar?
            image_tag("#{facility.facility_avatar}", alt: facility.name, width: width, height: width )
        else
            image_tag(image_uploader.default_url, alt: facility.name, width: width, height: width )
        end        
    end
end
