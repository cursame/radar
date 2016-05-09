require 'rails_helper'

RSpec.describe Denouncer, type: :model do
  context 'validations' do
    let(:denouncer) { create(:denouncer) }

    it 'should be valid with mandatory attributes' do
      expect(denouncer).to be_valid
    end

    it 'should not be valid without email' do
      denouncer.email = nil
      expect(denouncer).not_to be_valid
    end

    it 'has a gender default attribute set to prefer_not_to_disclose' do
      expect(denouncer.gender).to eq('prefer_not_to_disclose')
    end
  end
end
