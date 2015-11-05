class AppointmentsDog < ActiveRecord::Base
	belongs_to :dog
	belongs_to :appointment

	# return true if each date is booked 7+ dogs
	def self.list
		# collect booked dates in array from AppointmentDog model
		booked_date = Array.new
		AppointmentsDog.all.each  do |app_dog|
		 if !app_dog.appointment.nil?
		 	puts app_dog.appointment.app_date
      	   booked_date << app_dog.appointment.app_date.to_s  
      	 end
    	end
    	booked_date.sort  
    	# New hash key=date, value= # of dogs booked. find the date with 7+ dogs.
      	h = Hash.new(0)
		booked_date.each { | v | h.store(v, h[v]+1) }
		h.delete_if{ |key, value| value < 7}
    end

  
end