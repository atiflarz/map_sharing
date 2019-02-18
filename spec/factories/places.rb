FactoryGirl.define do
  factory :place do
    trait :test_place do
      user_id       { 1 }
    end
  end
end