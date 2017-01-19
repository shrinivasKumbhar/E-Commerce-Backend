require 'net/http'
require 'net/https'
class UsersController < ApplicationController

  def update_profile
    Rails.logger.info{"#{__FILE__} :##{__LINE__} signup start"}
    Rails.logger.info{"signup start :::: #{}"}
    response = Validator.signup_validator(params)
    if response[:success]
      render :json => UserService.new.user_signup(params)
    else
      render :json => response
    end
    Rails.logger.info{"#{__FILE__} :##{__LINE__} signup end"}
  end
  def login
    Rails.logger.info{"#{__FILE__} :##{__LINE__} login start"}
    response = UserService.new.userLogin(params)
    if response[:success]
      Rails.logger.info{"#{__FILE__} :##{__LINE__} response.data[:user_id]"}
      session[:user_id] = response[:data][:user_id]
      current_user(response[:data][:user_id])
      Rails.logger.info{"#{__FILE__} :##{__LINE__} response.data[:user_id]v!!!!!!!!!!!!#{session[:user_id]}"}
     
          
    end
    render :json => response 
    
    Rails.logger.info{"#{__FILE__} :##{__LINE__}login end"}
  end

  def sign_up
    Rails.logger.info{"#{__FILE__} :##{__LINE__} signup start"}
    begin
      response = Validator.signup_validator(params)
      if response[:success]
		response = UserService.new.signup(params)
		Rails.logger.info{"#{__FILE__} :##{__LINE__} signup start ####3#{response}"}
		render :json => response 
      else
        render :json => response
      end
    rescue => e
      Rails.logger.error{"#{__FILE__} :##{__LINE__}# :#Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__} :##{__LINE__}#signup end"}
  end
  
  def verify_otp
	Rails.logger.info{"#{__FILE__} :##{__LINE__}#verify_otp start"}
	begin
		render :json => UserService.new.verify_otp(params)
	rescue => e
		Rails.logger.info{"#{__FILE__} :##{__LINE__}# Exception : #{e.message}"}
	end
	Rails.logger.info{"#{__FILE__} :##{__LINE__}#verify_otp end"}
  end
end
