# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Concerts::CreateJob, type: :job do
  include ActiveJob::TestHelper

  describe '.perform' do
    it 'enqueues the create job' do
      concerts = [attributes_for(:concert), attributes_for(:concert)]

      assert_enqueued_with(job: described_class, queue: 'default') do
        described_class.perform_later(concerts)
      end
    end
  end
end
