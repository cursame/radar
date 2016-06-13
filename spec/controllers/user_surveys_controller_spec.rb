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
      @institution = create(:institution)
      @grade = create(:grade, institution_id: @institution.id)
      @group = create(:group, grade_id: @grade.id)
      @denouncer_attributes = attributes_for(:denouncer)
      @aggressor_attributes = attributes_for(:aggressor)
      @victim_attributes = attributes_for(:victim)
      @denouncer_attributes[:group_id] = @group.id
      @aggressor_attributes[:group_id] = @group.id
      @victim_attributes[:group_id] = @group.id
      ids = @survey.questions.map(&:id)
      post :create, user_survey: {
        survey_id: @survey.id,
        denouncer_attributes: @denouncer_attributes,
        aggressors_attributes: [@aggressor_attributes],
        victim_attributes: @victim_attributes
      },
      question_ids: ids
    end

    it 'should create a new user_survey' do
      user_survey_create = UserSurvey.find_by_survey_id(@survey.id)
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
