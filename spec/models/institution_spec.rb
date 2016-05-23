require 'rails_helper'

RSpec.describe Institution, type: :model do
  shared_examples 'a valid institution' do
    it 'should be valid' do
      expect(institution).to be_valid
    end
  end

  shared_examples 'an invalid institution' do
    it 'should be invalid' do
      expect(institution).not_to be_valid
    end
  end

  context 'with all mandatory fields' do
    let(:institution) { build_stubbed(:institution) }
    it_behaves_like 'a valid institution'
  end

  context 'without a title' do
    let(:institution) { build_stubbed(:institution, title: nil) }
    it_behaves_like 'an invalid institution'
  end

  context 'without a subdomain' do
    let(:institution) { build_stubbed(:institution, subdomain: nil) }
    it_behaves_like 'an invalid institution'
  end

  context 'with an invalid format subdomain' do
    let(:institution) { build_stubbed(:institution, subdomain: 'pruebas 1') }
    it_behaves_like 'an invalid institution'
  end
end
