require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do


	describe "GET INDEX" do
		it "renders the index templete" do
			get :index
			expect(response).to render_template('index')
		end

		it "returns http success" do 
			get :index
			expect(response).to have_http_status(:success)
		end
	end
end
