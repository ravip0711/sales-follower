class Admin::StoresController < ApplicationController
  def new
    @stores = Store.all
    @store = Store.new
    render :new
  end

  def create
    Store.create(store_params)
    redirect_to new_admin_store_path
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    redirect_to new_admin_store_path
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end
end
