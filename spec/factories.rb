FactoryGirl.define do
  factory :user do
    name     "Mihail Nosckov"
    email    "miha@test.com"
    password "password"
    password_confirmation "password"
  end
end