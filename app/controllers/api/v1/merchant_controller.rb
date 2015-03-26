class Api::V1::MerchantController < Api::V1::BaseController

  def index
    merchants = Merchant.all
    response = construct_merchants_list(merchants)
    render_json_success merchants: response
  end

  def show
    merchant = get_merchant
    if merchant.present?
      response = construct_merchant(merchant)
      render_json_success merchants: response
    else
      render_json_failure error: "Please enter email_address or id both"
    end
  end

  private
  def construct_merchants_list(merchants)
    merchants.map do |merchant|
      merchant_hash = {:id=>merchant.id, :email_address=>merchant.email_address, :name=>merchant.name, :type=>merchant.merchant_type, :expire_at=>merchant.expire_at} 
    end
  end

  def get_merchant
    if params[:id].present?
      merchant = Merchant.find(params[:id])
    elsif params[:email_address].present?
      merchant = Merchant.find_by_email_address(params[:email_address])
    end
  end

  def construct_merchant(merchant)
    merchant_info = {:id=>merchant.id, :email_address=>merchant.email_address, :name=>merchant.name, :type=>merchant.merchant_type, :expire_at=>merchant.expire_at} 
    merchant_info[:addresses] = construct_addresses(merchant.addresses)
    merchant_info[:deals] = construct_deals(merchant.deals)
    merchant_info
  end

  def construct_addresses(addresses)
    addresses.map do |addresse|
      {:id=>addresse.id, :addresse=>addresse.merchant_address, :pincode=>addresse.pincode, :latitude=>addresse.latitude, :longitude=>addresse.longitude, :mobile_no=>addresse.mobile_no}
    end
  end

  def construct_deals(deals)
    deals.map do |deal|
      {:id=>deal.id, :title=>deal.title, :description=>deal.description, :price=>deal.price, :discount=>deal.discount, :type=>deal.deal_type, :event_flag=>deal.event_flag, :logo_image=>deal.logo_image}
    end
  end 
end


