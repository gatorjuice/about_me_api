# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Concert, type: :model do
  # validations
  it { is_expected.to validate_presence_of(:band) }
  it { is_expected.to validate_presence_of(:source_id) }

  it do
    expect(described_class.new).to validate_uniqueness_of(:source_id)
      .scoped_to(:band)
      .with_message('Band at event is a duplicate, skipping creation.')
  end

  describe '#venue_name' do
    it 'returns the venue name of an event' do
      expect(build(:concert).venue_name).to eq('The Empty Bottle')
    end
  end
end
