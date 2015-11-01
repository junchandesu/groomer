require 'rails_helper'

RSpec.describe DogsController, :type => :controller do
	let(:user) { User.new(email: "test@test.com", password: "helloworld") }
	let(:my_dog) { Dog.new(name: "jace", gender: 'f', weight: '30', birthday: '1-5-2015', breed: 'akita', user: user)}

	describe "GET new" do

		it "renders the index template" do			
			expect(my_dog).to respond_to(:weight)
		end
		
	end



end


