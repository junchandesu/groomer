class AppointmentPolicy < ApplicationPolicy

	def booked_record?
		user.present? && user.admin?
	end

	  
end