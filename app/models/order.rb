class Order < ActiveRecord::Base
  self.table_name = 'order'
  
  attr_accessible :user_id, :deal_id, :deal_count, :is_redeem, :voucher_code, :rating, :integer
  
  belongs_to :user , :class_name => "User"
end
