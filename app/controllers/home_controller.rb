require 'shopsense'

class HomeController < ApplicationController
  def index
    if admin_signed_in?
      if current_admin.admin?
        redirect_to admin_path
      else
        reset_session
        redirect_to new_admin_session_path
        flash[:alert] = "Error: Admin does not have set permissions by webmaster, please contact webmaster."
      end
    elsif user_signed_in?
      @user_stores = current_user.stores

      # Start ShopSense API for ad
      unless @user_stores.empty?
        sale_products_array = []

        while sale_products_array.empty?
          store_ad = @user_stores.sample.name

          client = Shopsense::API.new({'partner_id' => 'uid7329-35979177-13'})
          response = client.search(store_ad)
          raw_products = JSON.parse(response)["products"]
          raw_products.each do |product|
            if !product["salePrice"].nil? && product["salePrice"] < product["price"]
              sale_products_array << product
            end
          end
        end

        if sale_products_array.empty?
          @ad_available = false
          # show a default picture or generic ad for any brands thats don't have a sale product.
        else
          @ad_available = true
          ad_product = sale_products_array.sample
          @ad_product_url = ad_product["url"]
          @ad_product_name = ad_product["name"]
          @ad_product_price = ad_product["price"]
          @ad_product_sale_price = ad_product["salePrice"]

          ad_product["images"].each do |image|
            if image["sizeName"] == "Large"
              @ad_image_link = image["url"]
            end
          end
        end
      end
      # End ShopSense API for ad

      render :index
    else
      redirect_to new_user_session_path
    end
  end
end
