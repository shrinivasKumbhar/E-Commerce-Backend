class AreasController < ApplicationController
  
  def get_societies
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_societies start"}
    begin
      if params[:area_id]
        render :json => AddressService.new.get_socities(params[:area_id])
      else
        render :json => ""
      end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_societies end"}
  end
end
