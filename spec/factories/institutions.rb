FactoryGirl.define do
  factory :institution do
    title { Faker::Name.name }
    subdomain { Faker::Internet.domain_word }
  end
end
