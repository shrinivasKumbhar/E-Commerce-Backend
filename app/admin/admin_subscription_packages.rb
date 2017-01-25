ActiveAdmin.register SubscriptionPackage do
  permit_params :subscription_packs_id, :days, :price, :created_at

  index do
    selectable_column
    id_column
    column :subscription_packs_id
    column :days
    column :price
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Subscription Packs Details" do
      f.input :subscription_packs_id
      f.input :days
      f.input :price
    end
    f.actions
  end
end