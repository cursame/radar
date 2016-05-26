require 'rails_helper'

RSpec.describe EvidenceLink, type: :model do
  shared_examples 'a valid evidence_link' do
    it 'should be valid' do
      expect(evidence_link).to be_valid
    end
  end

  shared_examples 'an invalid evidence_link' do
    it 'should be invalid' do
      expect(evidence_link).not_to be_valid
    end
  end

  context 'with all mandatory fields' do
    let(:evidence_link) { build_stubbed(:evidence_link) }
    it_behaves_like 'a valid evidence_link'
  end

  context 'without a url' do
    let(:evidence_link) { build_stubbed(:evidence_link, url: nil) }
    it_behaves_like 'an invalid evidence_link'
  end
end
