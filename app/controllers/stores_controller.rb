class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_stores = current_user.stores
    @stores = Store.all
  end

  def create
    @user = current_user

    if params[:user] == nil
      @user.store_ids = nil
    else
      @user.store_ids = params[:user][:store_ids]
    end

    if @user.save
      flash[:success] = "Favorite stores successfully updated."
      redirect_to user_stores_path(@user)
    else
      flash[:error] = "Error: Could not be updated."
      render :index
    end
  end

  def destroy
    @user = current_user
    store = @user.stores.find(params[:id])
    if @user.stores.delete(store)
      flash[:success] = "#{store.name} removed from your favorite list."
      redirect_to user_stores_path
    end
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be Logged in."
      redirect_to root_path
    end
  end
end
