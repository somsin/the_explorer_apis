class Event < ActiveRecord::Base

  self.table_name = 'event'

  attr_accessible :title, :deal_id, :start_at, :end_at, :logo_id

  has_one :deal :class_name => "Deal"
end
