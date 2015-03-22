class UserSubscribers < ActiveRecord::Base

  self.table_name = 'user_subscribers'

  attr_accessible :purchase, :expire_at, :user_id

  belongs_to :user , :class_name => "User"
end
