ActiveAdmin.register ProductImage do
  permit_params :id, :product_id, :image_url, :is_profile, :created_at

  index do
    selectable_column
    id_column
    column :product_id
    column :image_url do |image_url|
      link_to image_tag(image_url.image_url, :height => 50), admin_product_image_path(image_url)
    end
    column :is_profile
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Product Image" do
      f.input :product_id
      f.input :is_profile
      f.input :image_url
    end
    f.actions
  end

end