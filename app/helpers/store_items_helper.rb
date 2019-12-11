module StoreItemsHelper
    def store_item_avatar_for(store_item, width: "100%", height: "auto")
        image_uploader = ImageUploader.new
        if store_item.store_item_avatar?
            image_tag("#{store_item.store_item_avatar.thumb}", alt: store_item.name, width: width, height: height)
        else
            image_tag(image_uploader.default_url, alt: store_item.name, width: width, height: height)
        end
    end
    
    def store_item_big_image_for(store_item, width: "100%", height: "auto" )
        image_uploader = ImageUploader.new
        if store_item.store_item_avatar?
            image_tag("#{store_item.store_item_avatar}", alt: store_item.name, width: width, height: height)
        else
            image_tag(image_uploader.default_url, alt: store_item.name, width: width, height: height)
        end        
    end
    
    def convert_to_price(decimal_value)
        sprintf "%.2f", decimal_value
    end
end
