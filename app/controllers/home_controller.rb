class HomeController < ApplicationController
  def index
    if user_signed_in?
      @stores = Store.all
      render :index
    else
      redirect_to new_user_session_path
    end
  end
end
