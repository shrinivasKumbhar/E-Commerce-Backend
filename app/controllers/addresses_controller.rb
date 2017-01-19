class AddressesController < ApplicationController
  before_action :check_authorization, except: []
  
  def save
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save start"}
    begin
      response = Validation.save_address_validator(params)
      render :json => AddressService.new.save_address(params) 
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save end"}
  end
end
