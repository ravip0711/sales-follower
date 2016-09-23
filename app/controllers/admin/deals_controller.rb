class Admin::DealsController < ApplicationController
  def new
    @stores = Store.all
    @deals = Deal.all
    @deal = Deal.new
    render :new
  end

  def create
    Deal.create(deal_params)
    redirect_to new_admin_deal_path
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    redirect_to new_admin_deal_path
  end

  private

  def deal_params
    params.require(:deal).permit(:store_id, :title, :description)
  end
end
