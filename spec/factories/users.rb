FactoryGirl.define do
  factory :user do
    trait :test_user do
      email 'testuser@test.com'
      user_name 'test_user'
      password 'test@123'
      password_confirmation 'test@123'
    end
  end
end