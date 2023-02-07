ActiveAdmin.register Shift do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :start_time, :end_time, :roster_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:start_time, :end_time, :roster_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "Shift Details" do
      f.input :start_time, as: :time_picker
      f.input :end_time, as: :time_picker
      f.input :user_id, as: :select, collection: [['Select a Technician', '']] + User.where(role: "Technician").map {|u| [u.name, u.id]}
      f.input :roster_id, as: :select, collection: [['Select a Roster', '']] + Roster.all.map{|r| [r.roster_date, r.id]}
    end
    f.actions
  end
  
end
