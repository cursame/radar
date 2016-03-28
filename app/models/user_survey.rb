class UserSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  belongs_to :institution

  has_many :user_answers, dependent: :destroy
  has_one :aggressor
  has_one :victim

  accepts_nested_attributes_for :aggressor
  accepts_nested_attributes_for :victim

  after_save :evaluate_danger

  state_machine initial: :low do
    state :low
    state :middle
    state :high

    event :set_middle_danger do
      transition [:low] => :middle
    end

    event :set_high_danger do
      transition [:low, :middle] => :high
    end
  end

  def name_state
    if state == 'low'
      'baja'
    elsif state == 'middle'
      'media'
    else
      'alta'
    end
  end

  private

  def evaluate_danger
    total_questions = survey.questions.count
    total_answers = user_answers.count
    set_middle_danger if total_answers > (total_questions * 0.2)
    set_high_danger if total_answers > (total_questions * 0.5)
  end
end