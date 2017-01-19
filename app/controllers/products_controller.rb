class ProductsController < ApplicationController
  skip_before_action  :verify_authenticity_token

   def save
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save start"}
    begin
      render :json => ProductService.new.save_product(params)
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save end"}
  end

  def index
    Rails.logger.info{"#{__FILE__}: #{__LINE__} index start"}
    begin
      #render :json => Product.all
      @small_packages = SubscriptionPackage.where(:is_active => true, :subscription_packs_id => 1)
      @medium_packages = SubscriptionPackage.where(:is_active => true, :subscription_packs_id => 2)
      @large_packages = SubscriptionPackage.where(:is_active => true, :subscription_packs_id => 3)
      
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} index end"}
  end

  def show
    Rails.logger.info{"#{__FILE__}: #{__LINE__} show start"}
    begin
      render :json => ProductService.new.get_product(params)
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} show end"}
  end
end
