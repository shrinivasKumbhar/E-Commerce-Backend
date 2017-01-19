ActiveAdmin.register Cart do
  permit_params :user_id, :product_id, :quantity, :created_at

  index do
    selectable_column
    id_column
    column :user_id
    column :product_id
    column :quantity
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Cart Detail" do
      f.input :user_id
      f.input :product_id
      f.input :quantity
    end
    f.actions
  end
end