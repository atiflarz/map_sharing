require 'rails_helper'

RSpec.describe Place, type: :model do
  let(:place) { build(:place, :test_place ) }
  describe Place, 'factory' do
    it "has a valid factory" do
      expect(place).to be_valid
    end
  end

  describe Place, 'association' do
    it { should have_many(:place_recipients) }
    it { should have_many(:recipients).through(:place_recipients) }
  end

  describe Place, 'column_specification' do
    it { should have_db_column(:user_id).of_type(:integer).with_options(presence: true) }
  end
end