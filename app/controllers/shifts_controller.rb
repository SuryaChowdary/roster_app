class ShiftsController < ApplicationController
  
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :require_manager
  
  def index
    @shifts = Shift.all.order('created_at ASC')
  end

  def show
  end

  def new
    @shift = Shift.new
  end

  def edit
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to @shift, notice: 'Shift was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shift.update(shift_params)
      redirect_to @shift, notice: 'Shift was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_url, notice: 'Shift was successfully destroyed.'
  end

  private
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def shift_params
      params.require(:shift).permit(:start_time, :end_time, :roster_id, :user_id)
    end

    def require_manager
      unless current_user.role.name == "Manager"
        redirect_to root_path, notice: "You are not authorized to access this page."
      end
    end
end
