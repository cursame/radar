FactoryGirl.define do
  factory :aggressor do
    name { Faker::Name.name }
    group
    user_survey
  end
end
