ActiveAdmin.register Shift do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :start_time, :end_time, :user_id, :roster_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:start_time, :end_time, :user_id, :roster_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # Form to create or update a User
  form do |f|
    f.inputs "Shift Details" do
      f.input :start_time, as: :time_picker
      f.input :end_time, as: :time_picker
      f.input :user_id, as: :select, collection: [['Select a User', '']] + User.all.map{|r| [r.name, r.id]}
      f.input :roster_id, as: :select, collection: [['Select a Roster', '']] + Roster.all.map{|c| [c.roster_date, c.id]}
    end
    f.actions
  end

end
