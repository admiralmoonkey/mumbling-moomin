FactoryGirl.define do
  factory :order do
    user
    product
    total 400
  end
end
