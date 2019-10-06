class NewswirePost < ApplicationRecord
  belongs_to :member
  has_one_attached :image
  #Order the newswire posts with default scope
  default_scope -> { order(created_at: :desc) }
  
  validates :member_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  #Adding validations to images
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, 
                    size: { less_than: 5.megabytes, message: "should be less than 5MB" }
                    
  # Returns a resized image for display. 
  def display_image 
    image.variant(resize_to_limit: [500, 500]) 
  end
end
