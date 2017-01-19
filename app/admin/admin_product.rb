ActiveAdmin.register Product do
  permit_params :name, :display_name, :description, :price, :discount, :created_at, product_images_attributes: [:id, :product_id, :image_url]

  index do
    selectable_column
    id_column
    column :name
    column :display_name
    column :description
    # column "Primary Image" do |image_url_obj|
    #   link_to image_tag(image_url_obj.image_url, :height => 50), image_url_obj.image_url , target: '_blank' unless image_url_obj.image_url.blank?
    # end

    column :product_images do |product|
      table_for product.product_images do
        column do |product_image_obj|
          links = ''.html_safe
          #link_to product_image_obj.image.url , [ :admin, product_image_obj ] unless product_image_obj.image.blank?
          #links +=link_to image_tag(product_image_obj.image_url, :height => 50), admin_product_path(product_image_obj)#product_image_obj.image_url #, target: '_blank'  #unless product_image_obj.image_url.blank?
          links += link_to image_tag(product_image_obj.image_url, :height => 50)#, product_image_obj.image_url# , target: '_blank'  unless product_image_obj.image_url.blank?
          #   links += link_to "Set as primary?", set_as_profile_image_admin_products_path(:product_image_id => product_image_obj.id, :url => product_image_obj.image_url, :id => product.id),method: :post, :style => 'display:block !important;'
            links
        end
      end
    end
    column :price
    column :discount
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :display_name
      f.input :price
      f.input :discount
      f.inputs "product_images" do
        f.has_many :product_images do |p|
          if p.object.image_url.blank?
            p.input :image_url, :as => :file
            p.input :is_profile, :as => :check_boxes
          else
            p.input :image_url, :as => :file , :hint => p.template.image_tag(p.object.image_url.url, :height => 50) unless p.object.image_url.blank?
          end
        end
      end
    end
    f.actions
  end

end