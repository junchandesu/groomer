require 'rails_helper'

RSpec.describe Appointment do
	describe "GET INDEX" do
		let(:user) { User.new(email: "test@test.com", password: "helloworld") }
	#	let(:dog) { Dog.new(name: "jace", gender: 'f', weight: '30', birthday: '1-5-2015', breed: 'akita', user: user)}
		let(:appointment) { Appointment.new(app_date: '10/15/2015', check_in_time: '8:00', telephone: '3100000000', user: user)}
		
		describe "attributes" do
			it "should respond to appointment" do
				expect(appointment).to respond_to(:check_in_time)		
			end 
		end
	end
end


