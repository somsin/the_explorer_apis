class Merchant < ActiveRecord::Base
  include UUIDSupport  
  self.table_name = 'merchants'

  attr_accessible :email_address, :name, :address_id, :expire_at, :merchant_type, :uuid

  has_many :deals, :class_name => "Deal"

  has_many :addresses, :class_name => "Address"

end
