# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketmasterApiClient do
  subject(:client) { described_class }

  describe '.event_search' do
    it 'returns a list of events' do
      expect(client.event_search('postalCode' => '60618')).to eq('foo')
    end
  end
end
