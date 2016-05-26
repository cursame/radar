FactoryGirl.define do
  factory :evidence_link do
    url { Faker::Internet.url }
    user_survey
  end
end
