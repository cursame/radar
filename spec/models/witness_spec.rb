require 'rails_helper'

RSpec.describe Witness, type: :model do
  shared_examples 'a valid witness' do
    it 'should be valid' do
      expect(witness).to be_valid
    end
  end

  shared_examples 'an invalid witness' do
    it 'should be invalid' do
      expect(witness).not_to be_valid
    end
  end

  context 'with all mandatory fields' do
    let(:witness) { build_stubbed(:witness) }
    it_behaves_like 'a valid witness'
  end

  context 'without a name' do
    let(:witness) { build_stubbed(:witness, name: nil) }
    it_behaves_like 'an invalid witness'
  end

  context 'without an group' do
    let(:witness) { build_stubbed(:witness, group: nil) }
    it_behaves_like 'an invalid witness'
  end
end
