class RostersController < ApplicationController

  before_action :require_manager

  def index 
    @rosters = Roster.all.order('created_at ASC')
  end

  def show
    @roster = Roster.find(params[:id])
  end

  def new
    @roster = Roster.new
  end

  def create
    @roster = Roster.new(roster_params)
    if @roster.save
      redirect_to @roster, notice: 'Roster was successfully created.'
    else
      render :new
    end
  end

  def edit
    @roster = Roster.find(params[:id])
  end
  
  def update
    @roster = Roster.find(params[:id])
    if @roster.update(roster_params)
      redirect_to rosters_path, notice: 'Roster was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @roster = Roster.find(params[:id])
    @roster.destroy
    redirect_to rosters_path, notice: 'Roster was successfully destroyed.'
  end

  private

    def roster_params
      params.require(:roster).permit(:roster_date, :company_id)
    end
    
    def require_manager
      unless current_user.role == "Manager"
        redirect_to root_path, notice: "You are not authorized to access this page."
      end
    end
  
end
