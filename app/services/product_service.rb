class ProductService
  def save_product(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save_product start"}
    begin
      if params[:name].present?
        Product.transaction do
          product = Product.new(
              name: params[:name],
              description: params[:description],
              category_id: params[:category_id],
              display_name: params[:display_name],
              price: params[:price]
          )
          if product.save
            if params[:product_images].present?
              ProductImage.save_image(params[:product_images], product)
            end
            product_map = Maps.product_map(product)
            response = {:success => true, :data => product_map, :message => "product saved successfully"}
            return response
          else
            raise ActiveRecord::Rollback
          end
        end
      else
        response = {:success => false, :message => "please enter product name"}
      end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} save_product end"}
    return response
  end

  def get_product(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_product start"}
    begin
      product = Product.get_by_id(params[:product_id])
      if product.present?

      else

      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception :#{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_product end"}
  end
end