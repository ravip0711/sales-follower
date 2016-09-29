require 'shopsense'

class HomeController < ApplicationController
  def index
    if admin_signed_in?
      redirect_to admin_path
    elsif user_signed_in?
      @user_stores = current_user.stores

      # Start ShopSense API for ad
      unless @user_stores.empty?
        store_ad = @user_stores.sample.name

        client = Shopsense::API.new({'partner_id' => 'uid7329-35979177-13'})
        response = client.search(store_ad)
        raw_products = JSON.parse(response)["products"]
        sale_products_array = []
        raw_products.each do |product|
          if !product["salePrice"].nil? && product["salePrice"] < product["price"]
            sale_products_array << product
          end
        end

        if sale_products_array.empty?
          @ad_available = false
          # show a default picture or generic ad
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
