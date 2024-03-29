class UserSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  belongs_to :institution

  has_many :user_answers, dependent: :destroy
  has_many :aggressors
  has_many :witnesses
  has_many :evidence_links, dependent: :destroy
  has_one :victim
  has_one :denouncer, dependent: :destroy
  validates_associated :denouncer

  accepts_nested_attributes_for :aggressors, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :witnesses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :evidence_links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :victim
  accepts_nested_attributes_for :denouncer

  before_save :evaluate_violence_types
  after_save :evaluate_danger

  mount_uploaders :evidence, EvidenceUploader

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

  def evaluate_violence_types
    violence_types = []
    ViolenceType.all.each do |violence_type|
      count = 0
      user_answers.each do |user_answer|
        count += 1 if user_answer.question.violence_type == violence_type
      end
      violence_types << violence_type.name if 1 < count
    end
    self.violence_types_array = violence_types
  end
end
