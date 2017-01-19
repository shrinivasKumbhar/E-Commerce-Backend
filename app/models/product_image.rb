class ProductImage < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image_url, PhotoUploader
  def self.save_image(image, product_id)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save_image start"}
    begin
        product_image = ProductImage.new(
                        product_id: product_id,
                        image_url: image
        )
        if product_image.save
          Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception $$$$$$$$$$$$$$$$$$$$$$$$$: #{product_image.image_url}"}
        else

        end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save_image end"}
  end
end
