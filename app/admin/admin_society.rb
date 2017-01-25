ActiveAdmin.register Society do
  permit_params :area_id, :name, :description, :created_at

  index do
    selectable_column
    id_column
    column :area_id
    column :name
    column :description
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Society Details" do
      f.input :area_id
      f.input :name
      f.input :description
    end
    f.actions
  end
end