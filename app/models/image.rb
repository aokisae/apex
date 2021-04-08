class Image < ApplicationRecord
 
  belongs_to :message
  
  mount_uploader :image_url, ImageUploader
  
end
