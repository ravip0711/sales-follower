class DealsController < ApplicationController
  def index
    @deals = Deal.where(store_id: params[:store_id])
  end
end
