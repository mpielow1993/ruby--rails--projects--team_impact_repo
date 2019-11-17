module StoreItemsHelper
    def store_item_avatar_for(store_item)
        image_uploader = ImageUploader.new
        if store_item.store_item_avatar?
            image_tag("#{store_item.store_item_avatar.thumb}", alt: store_item.name)
        else
            image_tag(image_uploader.default_url, alt: store_item.name, size: 80)
        end
    end
end
