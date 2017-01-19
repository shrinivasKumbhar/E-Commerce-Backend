class Validator

  def self.update_profile_validator(params)
    response = {}
    if params[:first_name].present?
      if params[:email].present? && params[:password]
        if params[:mobile_no].present?
          response = {:success => true}
        else
          message = I18n.translate :enter_mobile_no
          response = {:success => false, :message => message}
        end
      else
        message = I18n.translate :enter_email_password
        response = {:success => false, :message => message}
      end
    else
      message = I18n.translate :enter_first_name
      response = {:success => false, :message => message}
    end
    return response
  end

  def self.signup_validator(params)
    if params[:mobile_no].present?
      if params[:email].present? && params[:password]
        response = {:success => true}
      else
        message = I18n.translate :enter_email_password
        response = {:success => false, :message => message}
      end
    else
      message = I18n.translate :enter_mobile_no
      response = {:success => false, :message => message}
    end
  end
  
  def save_address_validator(params) 
    if params[:society_id].present?
      if params[:address1].present?
        response = {:success => true}
      else
          message = I18n.translate :address_not_present
          response = {:success => false, :message => message}
      end
    else
      message = I18n.translate :society_not_present
      response = {:success => false, :message => message}
    end
  end
end
