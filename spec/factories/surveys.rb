FactoryGirl.define do
  factory :survey do
    description { Faker::Lorem.sentence }
    type_survey { Faker::Lorem.word }

    factory :survey_with_questions do
      transient do
        questions_count 2
      end

      after(:create) do |survey, evaluator|
        create_list(:question, evaluator.questions_count, survey: survey)
      end
    end
  end
end
