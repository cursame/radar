FactoryGirl.define do
  factory :witness do
    name { Faker::Name.name }
    group
    user_survey
  end
end
