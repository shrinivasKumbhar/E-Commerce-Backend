class CartService
  def add_to_cart(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} add_to_cart start"}
    response = {}
    begin
      if params[:user_id].present?
        if params[:product_id].present?
          cart = Cart.where(:user_id => params[:user_id], :product_id => params[:product_id]).first
          if cart.present?
            cart.update(:quantity => cart.quantity + params[:quantity])
            response = {:success => true, :data => cart, :message => ""}
          else
            cart = Cart.new(
                :product_id => params[:product_id],
                :user_id => params[:user_id],
                :quantity => params[:quantity]
            )
            if cart.save
              response = {:success => true, :data => cart, :message => ""}
            end
          end
        else
          response = {:success => false, :data => nil, :message => ""}
        end
      else
        response = {:success => false, :data => nil, :message => ""}
      end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} add_to_cart end"}
    return response
  end

  def get_users_cart(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_users_cart start"}
    response = {}
    begin
      if params[:user_id].present?
        cart_list = Cart.where(:user_id => params[:user_id])
        cart_map = Maps.user_cart_map(cart_list)
        message = I18n.translate :data_retrieved_successfully
        response = {:success => true, :data => cart_map, :message => message}
      else
        response = {:success => false, :data => "", :message => "User not present."}
      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_users_cart end"}
    return response
  end
end