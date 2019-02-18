require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  
  describe "GET #show" do
    it "assigns the requested holiday as @holiday" do
      place = FactoryGirl.create(:place, :test_place)
      get :show, params: {id: User.first.user_name}
      expect(response).to have_http_status(:success)
    end
  end
end
