FactoryGirl.define do
  factory :victim do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end
end
