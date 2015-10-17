class AppointmentsDog < ActiveRecord::Base
	belongs_to :dog
	belongs_to :appointment
end