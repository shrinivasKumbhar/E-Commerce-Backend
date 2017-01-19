ActiveAdmin.register User do
  permit_params :id, :first_name, :last_name, :email, :contact_no, :created_at

  index do
    selectable_column
    id_column
    column :id
    column :first_name
    column :last_name
    column :email
    column :contact_no
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "User Detail" do
      f.input :id
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :contact_no
    end
    f.actions
  end

end