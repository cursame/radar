FactoryGirl.define do
  factory :question do
    text { Faker::Lorem.sentence }
    violence_type
  end
end
