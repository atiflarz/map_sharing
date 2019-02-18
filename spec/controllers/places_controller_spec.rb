require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe "POST places#create" do
    context "with valid attributes" do
      it "should save the new place in the database"
      it "should redirect to the places#index page"
    end

    context "with invalid attributes" do
      it "should not save the new place in the database"
      it "should render places#new template"
    end
  end
end
