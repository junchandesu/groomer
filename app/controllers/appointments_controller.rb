class AppointmentsController < ApplicationController
  
  def create 
    #@user = current_user  
    # return if Appointment.fully_booked_for_today?
    #app_date = Date.new(params[:appointment][:app_date])

    dogs = params[:appointment][:dog_id]
    dogs.shift #dumps first blank id
    dog_count = dogs.count

   	@appointment = current_user.appointments.build(params_appo)


    if Appointment.unavailable_for?(@appointment, dog_count)
      flash[:error] = "No appt for that day"
      redirect_to :back and return
    end
     if @appointment.save
      # create appointments_dog object for all dogs
      # paramsß will have dog ids
        dogs.each do |dog|
          @appointment.appointments_dogs.create(dog_id: dog.to_i)
        end
  

      #   current_user.dogs.each do |dog|
      #    @appointments_dogs = @appointment.appointments_dogs.create(dog_id: dog.id)
      #   end
      #if @appointments_dog.save

  		  flash[:notice] = "reservation confirmed"
  		  redirect_to thank_you_path(current_user, @appointment)
  	  elsif 
  		  flash[:error] = "error saving appointment"
  		  render :new
  	  end
   end

  def index
    @appointments = Appointment.visible_to(current_user)

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
    @appointment = Appointment.find(params[:id])
    @user = User.find(params[:user_id])
    @appointment.user = @user
  end

  def update
    @appointment = Appointment.find(params[:id])
    @user = User.find(params[:user_id])
    @appointment.user = @user
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

  def booked_record
   puts "yea" #test
   puts params[:app_date] #test
   puts params[:user_id] #test
   @appointments = Appointment.where(app_date: params[:app_date]).order('check_in_time')
   @apps = Array.new
   @appointment_check_in_dates = @appointments.each do |app|
    @apps << app.check_in_time
   end
   puts @apps  #test
   respond_to do |format|
    format.js
    format.html
   end

  end

  private

  def params_appo
  	params.require(:appointment).permit(:app_date, :check_in_time, :telephone, :memo, :dog_id
      )
  end
end
