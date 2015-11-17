require 'rails_helper'

describe SuperadminController do
  let(:superadmin) { create(:superadmin) }

  before :each do
    sign_in superadmin
  end

  describe 'GET statistics' do
    before :each do
      get :statistics
    end

    it 'has 200 status' do
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      expect(response).to render_template(:statistics)
    end
  end
end