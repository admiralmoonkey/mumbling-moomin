FactoryGirl.define do
  factory :comment do
    body "This is the body text of a comment"
    rating 2
    user
    product
  end
end
