class Images < ActiveRecord::Base

  self.table_name = 'Images'
  
  attr_accessible :name, :deal_id, :image, :remote_image_url

  belongs_to :deal , :class_name => "Deal" 

  mount_uploader :image, ImageUploader
end
