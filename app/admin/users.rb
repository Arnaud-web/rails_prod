# ActiveAdmin.register User do

#   # See permitted parameters documentation:
#   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
#   # Uncomment all parameters which should be permitted for assignment
#   #
#   # permit_params :email, :encrypted_password, :role, :reset_password_token, :reset_password_sent_at, :remember_created_at
#   permit_params :email, :encrypted_password, :role
#   #
#   # or
#   #
#   # permit_params do
#   #   permitted = [:email, :encrypted_password, :role, :reset_password_token, :reset_password_sent_at, :remember_created_at]
#   #   permitted << :other if params[:action] == 'create' && current_user.admin?
#   #   permitted
#   # end
  
# end
ActiveAdmin.register User do
  permit_params :email,:role, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    # column :password
    actions
  end

  filter :email
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
