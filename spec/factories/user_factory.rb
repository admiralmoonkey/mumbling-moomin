FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com"}

  factory :user do
    email
    password "1234567890"
    first_name "Peter"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email
    password "1234567890"
  end
end
