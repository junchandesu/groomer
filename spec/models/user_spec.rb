require 'rails_helper'

RSpec.describe User, type: :model do 

	let(:user) { User.new(email: "test@test.com", encrypted_password: "helloworld") }

	describe "attributes" do
		it "should respond to email" do
			expect(user).to respond_to(:email)
		end
		it "should respond to password" do 
			expect(user).to respond_to(:encrypted_password)
		end
	end

end



