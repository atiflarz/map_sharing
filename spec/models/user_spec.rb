require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user, :test_user ) }
  describe User, 'factory' do
    it "has a valid factory" do
      expect(user).to be_valid
    end
  end

  describe User, 'association' do
    it { should have_many(:places) }
    it { should have_many(:place_recipients) }
  end

  describe "email_validation" do
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
  
  describe "user_name_validation" do
    it { should validate_uniqueness_of(:user_name) }
  end
  
  describe User, 'email_column_specification' do
    it { should have_db_column(:email).of_type(:string).with_options(presence: true) }
  end
  
  describe User, 'user_name_specification' do
    it { should have_db_column(:user_name).of_type(:string).with_options(presence: true) }
  end
end