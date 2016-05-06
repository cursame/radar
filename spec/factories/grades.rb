FactoryGirl.define do
  factory :grade do
    title { Faker::Name.institution_grade }
    institution
  end
end
