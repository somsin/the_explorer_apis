class Address < ActiveRecord::Base

  self.table_name = 'addresses'

  attr_accessible :country, :city, :state, :street, :pincode, :landmark, :latitude, :longitude, :mobile_no, :merchant_id, :uuid
  
  belongs_to :merchant , :class_name => "Merchant"

  geocoded_by :merchant_address
  after_validation :geocode

  def merchant_address
    self.street+" "+ self.city+" "+self.state+" "+self.country
  end
end
