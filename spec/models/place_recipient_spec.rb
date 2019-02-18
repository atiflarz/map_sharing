require 'rails_helper'

RSpec.describe PlaceRecipient, type: :model do
  let(:place_recipient) { build(:place_recipient, :test_place_recipient ) }
  describe PlaceRecipient, 'factory' do
    it "has a valid factory" do
      expect(place_recipient).to be_valid
    end
  end

  describe PlaceRecipient, 'association' do
    it { should belong_to(:place) }
  end

  describe PlaceRecipient, 'column_specification' do
    it { should have_db_column(:recipient_id).of_type(:integer).with_options(presence: true) }
  end

end