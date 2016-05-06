require 'rails_helper'

RSpec.describe Grade, type: :model do
  context 'validations' do
    let(:grade) { create(:grade) }

    it 'should be valid with mandatory attributes' do
      expect(grade).to be_valid
    end

    it 'should not be valid without title' do
      grade.title = nil
      expect(grade).not_to be_valid
    end
  end
end
