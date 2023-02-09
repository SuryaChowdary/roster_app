ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :name, :password,:password_confirmation, :role_id, :company_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :role, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
    # Displayed columns in the index view
    index do
      selectable_column
      column :id
      column :email
      column :name
      column :role
      column :company_id
      actions
    end
  
    # Displayed columns in the show view
    show do
      attributes_table do
        row :id
        row :email
        row :name
        row :role
        row :company_id
      end
    end
  
    # Form to create or update a User
    form do |f|
      f.inputs "User Details" do
        f.input :email
        f.input :name
        f.input :password
        f.input :password_confirmation
        f.input :role_id, as: :select, collection: [['Select a Role', '']] + Role.all.map{|r| [r.name, r.id]}
        f.input :company_id, as: :select, collection: [['Select a Company', '']] + Company.all.map{|c| [c.name, c.id]}
      end
      f.actions
    end
  
    # Filters for searching and filtering Users
    filter :email
    filter :name
    filter :role_id, as: :select, collection: [['Select a Role', '']] + Role.all.map{|r| [r.name, r.id]}
    filter :company_id, as: :select, collection: [['Select a Company', '']] + Company.all.map{|c| [c.name, c.id]}
  
end
