require 'rails_helper'

RSpec.describe Aggressor, type: :model do
  shared_examples 'a valid aggressor' do
    it 'should be valid' do
      expect(aggressor).to be_valid
    end
  end

  shared_examples 'an invalid aggressor' do
    it 'should be invalid' do
      expect(aggressor).not_to be_valid
    end
  end

  context 'with all mandatory fields' do
    let(:aggressor) { build_stubbed(:aggressor) }
    it_behaves_like 'a valid aggressor'
  end

  context 'without a name' do
    let(:aggressor) { build_stubbed(:aggressor, name: nil) }
    it_behaves_like 'an invalid aggressor'
  end

  context 'without an group' do
    let(:aggressor) { build_stubbed(:aggressor, group: nil) }
    it_behaves_like 'an invalid aggressor'
  end
end
