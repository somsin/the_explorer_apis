class User < ActiveRecord::Base
  include UUIDSupport

  self.table_name = 'users'
  attr_accessible :email_address, :username, :first_name, :last_name, :status, :uuid, :mobile_no, :device_id, :pin_code, :email_promotional, :signup_code, :session_flag, :password

  validates :email_address, presence: true
  
  has_many :orders, :class_name => "Order"

  has_one :subscriber, :class_name => "UserSubscribers"

  uuid_column :uuid, :string_format => :to_s, :version => :timestamp

  def self.add_new_user(signup_params)
    user = User.new(signup_params)
    user.session_flag = true
    user.save!
    {:email_address=>user.email_address, :mobile_no=>user.mobile_no, :uuid=>user.uuid, :name=>"#{user.first_name}" +"#{user.last_name}"}
  end

  def self.get_user_info(user)
    if user.present?
      {:email_address=>user.email_address, :mobile_no=>user.mobile_no, :uuid=>user.uuid, :name=>"#{user.first_name}" + "#{user.last_name}", :password => user.password, :session_flag => user.session_flag, :email_promotional=>user.email_promotional, :device_id=>user.device_id, :pin_code=>user.pin_code, :signup_code=>user.signup_code }
    else
      "User does not exits"
    end
  end

  def logout
    self.session_flag = false
    user.save!
  end

end
