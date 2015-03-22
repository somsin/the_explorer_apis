class AddressesController < ApplicationController
  def new
    @address = Address.new(:merchant_id => params[:merchant_id])
  end

  def create
    @address = Address.new(params[:address])
    if @address.save
      flash[:notice] = "Successfully created painting."
      redirect_to @address.merchant
    else
      render :action => 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      flash[:notice] = "Successfully updated painting."
      redirect_to @address.merchant
    else
      render :action => 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to @address.merchant
  end
end