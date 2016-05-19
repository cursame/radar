FactoryGirl.define do
  factory :user_survey do
    survey

    factory :user_survey_with_aggressors do
      transient do
        aggressors_count 2
      end

      after(:create) do |user_survey, evaluator|
        create_list(:aggressor, evaluator.aggressors_count, user_survey: user_survey)
      end
    end

    after(:create) do |user_survey|
      survey = user_survey.survey
      answers = []
      survey.questions.each do |question|
        answers << UserAnswer.new(
          question_id: question.id,
          user_survey_id: user_survey.id
        )
      end
      user_survey.user_answers = answers
      user_survey.save
    end
  end
end
