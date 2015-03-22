require 'uuid_support'
class Deal < ActiveRecord::Base
  include UUIDSupport
  self.table_name = 'deals'

  attr_accessible :title, :logo_id, :banner_ids, :description, :start_at, :end_at, :merchant_id, :price, :discount, :avail_count, :sold_count, :deal_type, :uuid, :event_flag, :logo_image, :image1, :image2, :image3, :image4, :remote_image_url

  belongs_to :merchant , :class_name => "Merchant"

  mount_uploader :logo_image, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
  # has_many :images, :class_name => "Images"

end
