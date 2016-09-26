class DealsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @deals = Deal.where(store_id: params[:store_id])
  end
end
