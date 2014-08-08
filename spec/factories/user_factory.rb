FactoryGirl.define do
  factory :user do
    name "Example User"
    email "user@example.com"
    password "password1234"
    password_confirmation "password1234"
  end
end