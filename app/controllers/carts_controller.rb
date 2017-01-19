class CartsController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def add_to_cart
    Rails.logger.info{"#{__FILE__}: #{__LINE__} add_to_cart start"}
    begin
      render :json => CartService.new.add_to_cart(params)
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} add_to_cart end"}
  end

  def get_users_cart
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_users_cart start"}
    begin
      Rails.logger.info{"#{__FILE__}: #{__LINE__} parmaass #{params}"}
      render :json => CartService.new.get_users_cart(params)
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_users_cart end"}
  end

  def update_quantity
    Rails.logger.info{"#{__FILE__}: #{__LINE__} update_quantity start"}
    begin

    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} update_quantity end"}
  end

  def remove_item
    Rails.logger.info{"#{__FILE__}: #{__LINE__} remove_item end"}
    begin
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} remove_item start"}
  end
end
