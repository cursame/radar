FactoryGirl.define do
  factory :victim do
    name { Faker::Name.name }
    group
    user_survey
  end
end
