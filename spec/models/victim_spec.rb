require 'rails_helper'

RSpec.describe Victim, type: :model do
  shared_examples 'a valid victim' do
    it 'should be valid' do
      expect(victim).to be_valid
    end
  end

  shared_examples 'an invalid victim' do
    it 'should be invalid' do
      expect(victim).not_to be_valid
    end
  end

  context 'with all mandatory fields' do
    let(:victim) { build_stubbed(:victim) }
    it_behaves_like 'a valid victim'
  end

  context 'without a name' do
    let(:victim) { build_stubbed(:victim, name: nil) }
    it_behaves_like 'an invalid victim'
  end

  context 'without an group' do
    let(:victim) { build_stubbed(:victim, group: nil) }
    it_behaves_like 'an invalid victim'
  end
end
