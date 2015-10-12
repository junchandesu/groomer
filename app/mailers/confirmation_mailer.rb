class ConfirmationMailer < ApplicationMailer
	default from: 'aliciajace@gmail.com'

	def appointment_confirmation(user, dog, appointment)
		headers["Message-ID"] = "<appointments/#{appointment.id}@fuji-pet-salon.herokuapp.com>" 
		headers["In-Reply-To"] = "<user/#{user.id}@fuji-pet-salon.herokuapp.com>"
		headers["References"] = "<user/#{user.id}@fuji-pet-salon.herokuapp.com>"
		@user = user
		@dog = dog
		@appointment = appointment

		mail(to: user.email, subject: "Groomer Reservation on #{dog.name} ")

	end
end
