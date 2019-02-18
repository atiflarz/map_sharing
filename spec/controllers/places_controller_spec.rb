require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  login_user
  
  def with_public_attributes
    {
      latitude: 22.578193,
      longitude: 88.428619,
      is_public: true
    }
  end
  
  def with_recipients_attributes
    user = FactoryGirl.create(:user, email: 'second_user@test.com', user_name: 'second', password: 'test@123', password_confirmation: 'test@123' )
    {
      latitude: 22.578193,
      longitude: 88.428619,
      is_public: true,
      place_recipients_attributes: {
        "#{rand(903814893)}": {
          recipient_id: user.id
        }
      }
    }
  end
  describe "GET #index" do
    it "it list all the branches" do
      place = FactoryGirl.create(:place, :test_place)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
    
  describe "POST places#create" do
    context "with with_public_attributes" do
      it "creates a new Place" do
        expect {
          post :create, params: {place: with_public_attributes }
        }.to change(Place, :count).by(1)
      end
    end
    
    context "with with_public_attributes" do
      it "creates a new Place" do
        expect {
          post :create, params: {place: with_recipients_attributes }
        }.to change(PlaceRecipient, :count).by(1)
      end
    end
    
    context "with invalid attributes" do
      it "creates a new Place" do
        expect {
          post :create, params: {place: {latitude: 22.578193} }
        }.to change(Place, :count).by(0)
      end
    end
  end
end
