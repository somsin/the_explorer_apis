class DealsController < ApplicationController
  def new
    @deal = Deal.new(:merchant_id => params[:merchant_id])
  end

  def create
    @deal = Deal.new(params[:deal])
    if @deal.save
      flash[:notice] = "Successfully created painting."
      redirect_to @deal.merchant
    else
      render :action => 'new'
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(params[:deal])
      flash[:notice] = "Successfully updated painting."
      redirect_to @deal.merchant
    else
      render :action => 'edit'
    end
  end

  def destroy
    @deal = Deal.find(params[:id])app/controllers/api/v1/deal_controller.rb
    @deal.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to @deal.merchant
  end
end