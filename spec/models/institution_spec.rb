require 'rails_helper'

RSpec.describe Institution, type: :model do
  context 'validations' do
    let(:institution) { create(:institution) }

    it 'should be valid with mandatory attributes' do
      expect(institution).to be_valid
    end
  end
end
