FactoryGirl.define do
  factory :group do
    title { Faker::Name.grade_group }
    grade
  end
end
