FactoryGirl.define do
  factory :denouncer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    user_survey

    trait :male do
      gender 0
    end

    trait :female do
      gender 1
    end
  end
end
