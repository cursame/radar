require 'rails_helper'

RSpec.describe Admin::UsersController do
  describe 'GET #index' do
    before :each do
      get :index
    end

    it 'assigns users' do
      user = FactoryGirl.create(:user)
      expect(assigns(:users)).to eq([user])
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
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
      @email = Faker::Internet.email
      @institution = create(
        :institution,
        title: Faker::Company.name,
        subdomain: Faker::Internet.domain_word
      )
      post :create, user: {
        name: Faker::Name.name,
        email: @email,
        gender: :male,
        institution_id: @institution.id
      }
    end

    it 'should create a new user' do
      user_create = User.find_by_email @email
      expect(user_create).not_to be_nil
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to(admin_users_path)
    end
  end

  describe 'GET #show' do
    before :each do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    before :each do
      user = FactoryGirl.create(:user)
      get :edit, id: user.id
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
      @user = FactoryGirl.create(:user, :female)
      @new_name = Faker::Name.name
      @new_email = Faker::Internet.email
      @new_gender = 0
      @new_institution = create(
        :institution,
        title: Faker::Company.name,
        subdomain: Faker::Internet.domain_word
      )

      patch :update, id: @user.id, user: {
        name: @new_name,
        email: @new_email,
        gender: @new_gender,
        institution_id: @new_institution
      }

      it 'should update user name' do
        expect(@user.name).to eq(@new_name)
      end

      it 'should update user email' do
        expect(@user.email).to eq(@new_email)
      end

      it 'should update user gender' do
        expect(@user.gender).to eq(@new_gender)
      end

      it 'should update user\'s institution' do
        expect(@user.institution.id).to eq(@new_institution.id)
      end

      it 'has 302 status' do
        expect(response.status).to eq(302)
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(admin_users_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user = FactoryGirl.create(:user)
      delete :destroy, id: @user.id
    end

    it 'should delete the user' do
      user = User.find_by(email: @user.email)
      expect(user).to be_nil
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to(admin_users_path)
    end
  end
end
