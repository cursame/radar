FactoryGirl.define do
  factory :user_survey do
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
