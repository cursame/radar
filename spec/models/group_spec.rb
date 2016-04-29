require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'validations' do
    let(:group) { create(:group) }

    it 'should be valid with mandatory attributes' do
      expect(group).to be_valid
    end

    it 'should not be valid without title' do
      group.title = nil
      expect(group).not_to be_valid
    end
  end
end
