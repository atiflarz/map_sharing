FactoryGirl.define do
  factory :place do
    trait :test_place do
      user_id 1
      latitude  22.578193
      longitude 88.428619
    end
  end
end