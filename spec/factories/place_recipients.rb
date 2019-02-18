FactoryGirl.define do
  factory :place_recipient do
    trait :test_place_recipient do
      place_id 1
      recipient_id 1
    end
  end
end