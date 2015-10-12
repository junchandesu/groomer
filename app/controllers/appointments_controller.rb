class AppointmentsController < ApplicationController
  
  def create 
    @user = current_user   
  	@appointment = Appointment.new(params_appo)
    @appointment.user = @user
  	if @appointment.save
  		flash[:notice] = "reservation confirmed"
  		redirect_to thank_you_path(current_user, @appointment)
  	elsif 
  		flash[:error] = "error saving appointment"
  		render :new
  	end
  end

  def index
    @appointments = current_user.appointments.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def thank_you
    @appointment = current_user.appointments.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @user = current_user
  end

  def edit
    @appointment = current_user.appointments.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params_appo)
      flash[:notice] = "reservation confirmed"
      redirect_to thank_you_path(current_user, @appointment)    
    else
      flash[:error] = "Appointment is upated."
      redirect_to :back
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      redirect_to :back, notice: "Appointment is deleted."
    else
      flash[:error] = "Appointment is deleted."
      redirect_to :back
    end
  end

  private

  def params_appo
  	params.require(:appointment).permit(:app_date, :check_in_time, :telephone, :memo, :dog_id)
  end
end
