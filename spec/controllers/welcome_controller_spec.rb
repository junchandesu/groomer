require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
	describe "GET INDEX" do
		it "renders the index templete" do
			get :index
			expect(response).to render_template('index')
		end
	end
end
