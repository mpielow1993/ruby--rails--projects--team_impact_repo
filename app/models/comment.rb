class Comment < ApplicationRecord
  belongs_to :newswire_post
  #has_one :member, through: :newswire_post
  belongs_to :member
  has_one_attached :image
  
  default_scope -> { order(created_at: :asc) }
  
  validates :newswire_post_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  
  #Adding validations to images
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, 
                    size: { less_than: 5.megabytes, message: "should be less than 5MB" }
                    
  # Returns a resized image for display. 
  def display_image 
    image.variant(resize_to_limit: [1000, 1000]) 
  end
end
