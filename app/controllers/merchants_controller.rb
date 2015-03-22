class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new(params[:merchant])
    if @merchant.save
      flash[:notice] = "Successfully created merchant."
      redirect_to @merchant
    else
      render :action => 'new'
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    if @merchant.update_attributes(params[:merchant])
      flash[:notice] = "Successfully updated merchant."
      redirect_to merchant_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy
    flash[:notice] = "Successfully destroyed merchant."
    redirect_to merchants_url
  end
end