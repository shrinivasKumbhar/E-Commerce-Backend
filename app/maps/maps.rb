class Maps

  def self.user_map_with_token(user, token)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} user_map_with_token start"}
    user_map = {:user_id => user.id, :first_name => user.first_name, :last_name => user.last_name,
                :email => user.email, :mobile_no => user.mobile_no, :access_token => token}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} user_map_with_token end"}
    return user_map
  end
  def self.user_cart_map(cart_list)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} user_cart_map start"}
    cart_list_map = []
    cart_list.each do |cart|
      image_url = ""
      if cart.product.product_images.present?
        image_url = cart.product.product_images[0].image_url.url
      end
      cart_map = {:product_id => cart.product.id, :product_name => cart.product.name, :quantity => cart.quantity,
                  :price => cart.product.price, :image_url => image_url}
      cart_list_map.push(cart_map)
    end
    return cart_list_map
    Rails.logger.info{"#{__FILE__}: #{__LINE__} user_cart_map end"}
  end

  def self.packs_map(p, packages)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} packs_map start"}
    packages_map = []
    packages.each do |package|
        map = {:package_id => package.id, :pack_id => package.subscription_packs_id, :days => package.days,
              :price => package.price}
      packages_map.push(map)
    end
    pack_map = {:pack_id => p.id, :pack_name => p.name, :packages => packages_map}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} packs_map end"}
    return pack_map
  end
  
  def self.package_map(package)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} package_map start #{package.inspect}"}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} package_map start #{package.subscription_pack.inspect}"}
    pack = SubscriptionPack.find_by_id(package.subscription_packs_id)
    map = {:pack_id => pack.id, :pack_name => pack.name, :package_id => package.id,
          :days => package.days, :price => package.price}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} package_map end"}
    return map
  end

  def self.product_map(product)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} product_map start"}
    map = {:product_id => product.id, :product_name => product.name, :description => product.description,
          :display_name => product.display_name, :price => product.price}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} product_map end"}
    return map
  end
  
  def self.society_map(society)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} society_map start"}
    map = {:society_id => society.id, :area_id => society.area_id, :name => society.name, 
          :description => society.description }
    Rails.logger.info{"#{__FILE__}: #{__LINE__} society_map end"}
    return map
  end
end