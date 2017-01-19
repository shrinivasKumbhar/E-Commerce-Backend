class UserService

  def update_profile(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} user_signup start"}
    response = {}
    begin
      user = User.where("email = ? OR mobile_no = ?", params[:email], params[:mobile_no]).first
      if user.present?
        message = I18n.translate :email_or_mobile_no_already_registered
        response = {:success => false, :message => message}
      else
        user = User.new(
                       first_name: params[:first_name],
                       last_name: params[:last_name],
                       email: params[:email],
                       mobile_no: params[:mobile_no],
                       password: params[:password]
        )
        if user.save
          message = I18n.translate :user_signup_success
          response = {:success => true, :data => "", :message => message}
        else
          Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{user.errors.full_messages.join(', ')+'.'}"}
          message = I18n.translate :internal_server_error
          response = {:success => false, :message => message}
        end
      end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
      message = I18n.translate :internal_server_error
      response = {:success => false, :message => message}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} user_signup end"}
    return response
  end

  def userLogin(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} login start"}
    begin
      if params[:username].present? && params[:password]
        user =User.where("(email = ? OR mobile_no = ?) AND password = ?",params[:username], params[:username], params[:password]).first
        if user.present?
          token = User.new.generate_access_token(user.id)
          user_map = Maps.user_map_with_token(user, token)
          message = I18n.translate :user_login_success
          
          response = {:success => true, :data => user_map, :message => message}
        else
          message = I18n.translate :invalid_email_password
          response = {:success => false, :message => message}
        end
      else
        message = I18n.translate :enter_username_password
        response = {:success => false, :message => message}
      end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
      message = I18n.translate :internal_server_error
      response = {:success => false, :message => message}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} login end"}
    return response
  end

  def signup(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} generate_OTP start"}
    response = {}
    begin
      user = User.where("mobile_no = ? OR email = ?", params[:mobile_no], params[:email]).first
      if user.present?
        if user.is_verified
          response = {:success => false, :data => "USER_ALREADY_REGISTERED", :message => "USER_ALREADY_REGISTERED"}
        else
          otp_response = store_otp(params, user)
		  if otp_response[:success]
                  message = I18n.translate :user_signup_success
                  response = {:success => true, :data => "", :message => message}
            else
              message = I18n.translate :internal_server_error
              response = {:success => false, :data => "", :message => message}
            end
        end
      else
        User.transaction do
          user = User.new(
                  email: params[:email],
                  mobile_no: params[:mobile_no],
                  password: params[:password]
          )
          if user.save
            otp_response = store_otp(params, user)
            if otp_response[:success]
                  message = I18n.translate :user_signup_success
                  response = {:success => true, :data => "", :message => message}
            else
              raise ActiveRecord::Rollback
              message = I18n.translate :internal_server_error
              response = {:success => false, :data => "", :message => message}
            end
          else
            raise ActiveRecord::Rollback
            Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{user.errors.full_messages.join(', ')+'.'}"}
            message = I18n.translate :internal_server_error
            response = {:success => false, :data => "", :message => message}
          end
        end
      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
      message = I18n.translate :internal_server_error
      response = {:success => false, :data => "", :message => message}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} generate_OTP(params) end"}
	Rails.logger.info{"#{__FILE__}: #{__LINE__} generate_OTP(params) end@@#@#@@#@#@ #{response}"}
    return response
  end

  def store_otp(params, user)
    Rails.logger.info{"#{__FILE__}: #{__LINE__}store_otp start"}
    begin
      otp_digit = get_unique_Otp
      response = {}
      otp = OtpStore.find_by_contact_no(params[:mobile_no])
      if otp.present?
        otp.update(:otp => otp_digit)
        url ="https://control.msg91.com/api/sendhttp.php?authkey=136759Au7U3BSym0G5874833d&mobiles=8600915055&message=generatedotp&sender=asdfgh&route=4&country=91"
        #HTTPUtility.https_get(url)
        message = I18n.translate :otp_sent_success
        response = {:success => true, :data => "", :message => message}
      else
        otp = OtpStore.new(
                          contact_no: params[:mobile_no],
                          otp: otp_digit,
                          user_id: user.id
        )
        if otp.save
          url ="https://control.msg91.com/api/sendhttp.php?authkey=136759Au7U3BSym0G5874833d&mobiles=8600915055&message=generatedotp&sender=asdfgh&route=4&country=91"
          #HTTPUtility.https_get(url)
          message = I18n.translate :otp_sent_success
          response = {:success => true, :data => "", :message => message}
        else
          Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{otp.errors.full_messages.join(', ')+'.'}"}
          message = I18n.translate :internal_server_error
          response = {:success => false, :data => "", :message => message}
        end
      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__}store_otp end"}
    return response
  end

  def get_unique_Otp
    Rails.logger.info{"#{__FILE__}: #{__LINE__}get_unique_Otp start"}
    otp_digit = rand.to_s[2..5]
    begin
      otp = ""
      otp = OtpStore.find_by_otp(otp_digit)
      if otp.present?
        otp_digit = rand.to_s[2..5]
      else
        break
      end
    end until true
    Rails.logger.info{"#{__FILE__}: #{__LINE__}get_unique_Otp end"}
    return otp_digit
  end
  
  def verify_otp(params)
	Rails.logger.info{"#{__FILE__}: #{__LINE__}verify_otp start"}
	response = {}
	begin
		if params[:otp].present?
			otp_store = OtpStore.find_by_otp(params[:otp])
			if otp_store.present?
				User.transaction do
					otp_store.user.update(:is_verified => true)
					otp_store.delete
					token = User.new.generate_access_token(otp_store.user.id)
					user_map = Maps.user_map_with_token(otp_store.user, token)
					message = I18n.translate :user_login_success
					response = {:success => true, :data => user_map, :message => message}
				end
			else
				message = I18n.translate :invalid_otp
				response = {:success => false, :data => "", :message => message}
			end
		else
			message = I18n.translate :enter_otp
			response = {:success => false, :data => "", :message => message}
		end
	rescue => e
		Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
	end
	Rails.logger.info{"#{__FILE__}: #{__LINE__}verify_otp end"}
	return response
  end
end
