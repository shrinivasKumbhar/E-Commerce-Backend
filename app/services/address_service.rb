class AddressService
  
  def address_list
    Rails.logger.info{"#{__FILE__}: #{__LINE__} index start"}
    response = {}
    begin
      addresses = UserAddress.where(:is_active => true)
      if address.present?
        response = {:success => true, :data => addresses, :message => ""}
      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} index end"}
    return response
  end
  
  def save_address(params) 
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save_address start"}
    response = {}
    begin
      society = Society.find_by_id(params[:society_id])
      if society.present?
        address = UserAddress.new(
                  society_id: params[:society_id],
                  user_id: user.id,
                  address1: params[:address1],
                  address2: params[:address2]                  
                  )        
        if address.save
          message = I18n.translate :address_save_success
          response = {:success => true, :data => address, :message => message}
        else
          message = I18n.translate :address_save_error
          response = {:success => false, :message => message}
        end
      else
          
      end
      
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save_address end"}
    return response
  end
  
  def update_address(params) 
    Rails.logger.info{"#{__FILE__}: #{__LINE__} update_address start"}
    response = {}
    begin
      address = UserAddress.find_by_id(params[:address_id])
      if address.present?
        society = Society.find_by_id(params[:society_id])
        if society.present?
          address = UserAddress.update(
                    :society_id => params[:society_id],
                    :user_id => user.id,
                    :address1 => params[:address1],
                    :address2 => params[:address2]                  
                    )        
          
            message = I18n.translate :address_save_success
            response = {:success => true, :data => address, :message => message}
        else
          message = I18n.translate :address_save_error
          response = {:success => false, :message => message}
        end
      else
        message = I18n.translate :address_save_error
        response = {:success => false, :message => message}
      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} update_address end"}
    return response
  end 
end
