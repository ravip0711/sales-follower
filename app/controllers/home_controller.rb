class HomeController < ApplicationController
  def index
    if admin_signed_in?
      redirect_to admin_path
    elsif user_signed_in?
      @user_stores = current_user.stores
      render :index
    else
      redirect_to new_user_session_path
    end
  end
end
