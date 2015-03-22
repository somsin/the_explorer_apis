class Api::V1::UserController < Api::V1::BaseController
  before_filter :validate_signup_params, :only => [:signup]

  def signup
    user = User.add_new_user(@signup_args)
    render_json_success user: user
  end

  def login
    if params[:email_address].present? && params[:password].present?
      user = User.find_by_email_address_and_password(params[:email_address], params[:password])
      if user.present?
        response = {:email_address=>user.email_address, :mobile_no=>user.mobile_no, :uuid=>user.uuid, :name=>"#{user.first_name}"+" #{user.last_name}"}
        render_json_success user: response
      else
        render_json_failure error: "Email or password is invalid"
      end
    else
      render_json_failure error: "Please enter email_address and password both"
    end
    render_json_success message: "Success"
  end

  def logout
    if params[:email_address].present?
      user = User.find_by_email_address(params[:email_address])
      user.logout()
      render_json_success message: "#{params[:email_address]} logout Successfully"
    end
  end

  def purchase
    user = User.find_by_email_address(params[:uuid])
    subscriber = user.subscriber
    if subscriber.present?
      subscriber.expire_at = params[:expire_at]
      subscriber.purchase = params[:purchase]
      subscriber.save!
    else
      user.create_subscriber!(:expire_at => params[:expire_at], :purchase=>params[:purchase])
    end
    render_json_success message: "Success"
  end

  def reset_password
    if params[:email_address].present? && params[:password].present?
      user = User.find_by_email_address(params[:email_address])
      if user.present?
        user.password = params[:password]
        user.save!
        render_json_success message: "Password updated Successfully"
      else
        render_json_failure error: "#{params[:email_address]} is not exits please re-cheak and try again"
      end
    else
      render_json_failure error: "Please enter Email Address and password both"
    end
  end

  def user_detail
    if params[:uuid].present?
      user = User.find_by_uuid(params[:uuid])
      render_json_success user: User.get_user_info(user)
    elsif params[:email_address].present?
      user = User.find_by_email_address(params[:email_address])
      render_json_success user: User.get_user_info(user)
    end 
  end

  private

  def validate_signup_params
    if !params[:email_address].present?
      render_json_failure error: "Please Enter Email Address"
    elsif User.find_by_email_address(params[:email_address]).present?
      render_json_failure error: "#{params[:email_address]} email_address is already exits"
    else
      @signup_args = params.slice(:email_address, :first_name, :last_name, :mobile_no, :device_id, :pin_code, :email_promotional, :password)
    end    
  end

end