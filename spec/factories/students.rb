FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    institution
  end
end
