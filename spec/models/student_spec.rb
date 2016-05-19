require 'rails_helper'

RSpec.describe Student, type: :model do
  shared_examples 'a valid student' do
    it 'should be valid' do
      expect(student).to be_valid
    end
  end

  shared_examples 'an invalid student' do
    it 'should be invalid' do
      expect(student).not_to be_valid
    end
  end

  context 'with all mandatory fields' do
    let(:student) { build_stubbed(:student) }
    it_behaves_like 'a valid student'
  end

  context 'without a name' do
    let(:student) { build_stubbed(:student, name: nil) }
    it_behaves_like 'an invalid student'
  end

  context 'without an institution' do
    let(:student) { build_stubbed(:student, institution: nil) }
    it_behaves_like 'an invalid student'
  end
end
