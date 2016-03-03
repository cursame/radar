FactoryGirl.define do
  factory :aggressor do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end
end
