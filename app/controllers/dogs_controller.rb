class DogsController < ApplicationController

  def create
    @user = current_user
    @dog= Dog.new(params_dog)
    @dog.user = @user
  	if @dog.save
  		flash[:notice] = "Your dog information is saved"
  		redirect_to new_user_appointment_path(current_user)
  	else
  		flash[:error] ="Error saving the dog information"
  		render :new
  	end
  end	

  def index
  	@dogs = current_user.dogs.all
  end

  def show
  	@dog = Dog.find(params[:id])
  end

  def new
  	@dog = Dog.new
    @user = current_user
  end

  def edit
  	@dog = Dog.find(params[:id])
  end

  def update
  	@dog = Dog.find(params[:id])
	if @dog = @dog.update_attributes(params_dog)
  		flash[:notice] = "Your dog information is updated"
  		redirect_to new_user_dog_path(current_user, @dog)
  	else
  		redirect_to :back
  	end
  end

  def destroy
  	@dog = Dog.find(params[:id])
  	if @dog.destroy
  		redirect_to :back
  	else
  		flash[:error] ="Error deleting the dog information"
  		redirect_to :back
  	end


  end

  private

  def params_dog
  	params.require(:dog).permit(:name, :gender, :birthday, :weight, :breed, :mix)
  end
end
