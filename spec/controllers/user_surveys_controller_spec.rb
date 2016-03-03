require 'rails_helper'

RSpec.describe UserSurveysController, type: :controller do
  let(:user) { create(:user) }

  before :each do
    sign_in user
  end

  describe 'GET #new' do
    before :each do
      get :new
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    before :each do
      @survey = create(:survey_with_questions)
      @aggressor_attributes = attributes_for(:aggressor)
      @victim_attributes = attributes_for(:victim)
      ids = @survey.questions.map { |question| question.id }
      post :create, user_survey: {
        user_id: user.id,
        survey_id: @survey.id,
        aggressor_attributes: @aggressor_attributes,
        victim_attributes: @victim_attributes
      },
      question_ids: ids
    end

    it 'should create a new user_survey' do
      user_survey_create = UserSurvey.find_by_user_id(user.id)
      expect(user_survey_create).not_to be_nil
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to(root_path)
    end
  end
end
