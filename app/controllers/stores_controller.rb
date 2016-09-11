class StoresController < ApplicationController
  def index
    @user = current_user
    @user_stores = current_user.stores
    @stores = Store.all
  end

  def create
    @user = current_user
    @user.store_ids = params[:user][:store_ids]

    if @user.save
      flash[:success] = "Favorite stores successfully updated."
      redirect_to user_stores_path(@user)
    else
      flash[:error] = "Error: Could not be updated."
      render :index
    end
  end
end
