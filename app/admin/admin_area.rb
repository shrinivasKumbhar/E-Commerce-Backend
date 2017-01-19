ActiveAdmin.register Area do
  permit_params :name, :pincode, :created_at

  index do
    selectable_column
    id_column
    column :name
    column :pincode
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Area Details" do
      f.input :name
      f.input :pincode
    end
    f.actions
  end
end