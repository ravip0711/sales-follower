class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user_stores = current_user.stores
      render :index
    else
      redirect_to new_user_session_path
    end
  end
end
