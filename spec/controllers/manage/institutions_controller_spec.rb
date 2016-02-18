require 'rails_helper'

RSpec.describe Manage::InstitutionsController, type: :controller do
  let(:superadmin) { create(:superadmin) }

  before :each do
    sign_in superadmin
  end

  describe 'GET #index' do
    before :each do
      get :index
    end

    it 'assigns institutions' do
      institution = Institution.last
      expect(assigns(:institutions)).to eq([institution])
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before :each do
      institution = create(:institution)
      get :show, id: institution.id
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
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
      @institution_attributes = FactoryGirl.attributes_for(:institution)
      post :create, institution: @institution_attributes
    end

    it 'should create a new institution' do
      institution = Institution.find_by(title: @institution_attributes[:title])
      expect(institution).not_to be_nil
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to(manage_institutions_path)
    end
  end

  describe 'GET #edit' do
    before :each do
      get :edit, id: create(:institution).id
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @institution = create(:institution)
      @institution_attributes = FactoryGirl.attributes_for(:institution)
      patch :update, id: @institution.id, institution: @institution_attributes
      @institution.reload
    end

    it 'should update institution title' do
      expect(@institution.title).to eq(@institution_attributes[:title])
    end

    it 'should update institution subdomain' do
      expect(@institution.subdomain).to eq(@institution_attributes[:subdomain])
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to(manage_institution_path(@institution.id))
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @institution = create(:institution)
      delete :destroy, id: @institution.id
    end

    it 'should delete the institution' do
      institution = Institution.find_by_id(@institution.id)
      expect(institution).to be_nil
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to users_path' do
      expect(response).to redirect_to(manage_institutions_path)
    end
  end
end
