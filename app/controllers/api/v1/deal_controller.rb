class Api::V1::DealController < Api::V1::BaseController

  def index
    deals = Deal.all
    response = construct_deals_list(deals)
    render_json_success deals: response
  end

  def show
    deal = get_deal
    if deal.present?
      response = construct_deal(deal)
      render_json_success deal: response
    else
      render_json_failure error: "Please enter deal id"
    end
  end



  private

  def get_deal
    Deal.find(params[:id]) if params[:id].present?
  end

  def construct_deals_list(deals)
    deals.map do |deal|
      construct_deal(deal)
    end
  end

  def construct_deal(deal)
    {
      :id=>deal.id, 
      :title=>deal.title, 
      :description=>deal.description, 
      :price=>deal.price, 
      :discount=>deal.discount, 
      :type=>deal.deal_type, 
      :event_flag=>deal.event_flag, 
      :logo_image=>deal.logo_image,
      :image1=>deal.image1,
      :image2=>deal.image2,
      :image3=>deal.image3,
      :image4=>deal.image4,
      :start_at=>deal.start_at,
      :end_at=>deal.end_at,
      :avail_count=>deal.avail_count,
      :sold_count=>deal.sold_count,
      :merchant_info=>merchant_info(deal.merchant) if deal.merchant.present?,
      :address_info=>address_info(deal.merchant.addresses.first) if deal.merchant.present? && deal.merchant.addresses.present? && deal.merchant.addresses.first.present?
    }
  end

  def merchant_info(merchant)
    {:id=>merchant.id, :email_address=>merchant.email_address, :name=>merchant.name, :type=>merchant.merchant_type, :expire_at=>merchant.expire_at} 
  end

  def address_info(addresse)
    {:id=>addresse.id, :addresse=>addresse.merchant_address, :pincode=>addresse.pincode, :latitude=>addresse.latitude, :longitude=>addresse.longitude, :mobile_no=>addresse.mobile_no}
  end

end