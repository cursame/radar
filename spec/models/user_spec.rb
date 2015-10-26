require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let(:user) { create(:user) }

    it 'should be valid with mandatory attributes' do
      expect(user).to be_valid
    end

    it 'should not be valid without email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'should not be valid with a short password' do
      user.password = 'short'
      user.password_confirmation = 'short'
      expect(user).not_to be_valid
    end

    it 'has a accepted_terms default attribute set to false' do
      expect(user.accepted_terms).to eq(false)
    end

    it 'has a gender default attribute set to prefer_not_to_disclose' do
      expect(user.gender).to eq('prefer_not_to_disclose')
    end
  end
end
