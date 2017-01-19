class ProductImagesController < ApplicationController

  def upload_image
    Rails.logger.info{"#{__FILE__}: #{__LINE__} upload_image start"}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} upload_image start #{params}"}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} upload_image start@@@@@@@@@@@@@@@@@@ #{params[:product_id]}"}
    Rails.logger.info{"#{__FILE__}: #{__LINE__} upload_image start################# #{params[:image]}"}
    render :json => ProductImage.save_image(params[:image], params[:product_id])
    Rails.logger.info{"#{__FILE__}: #{__LINE__} upload_image end"}
  end
end
