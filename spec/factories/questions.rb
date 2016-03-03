FactoryGirl.define do
  factory :question do
    text { Faker::Lorem.sentence }
    type_violence { Faker::Lorem.word }
  end
end
