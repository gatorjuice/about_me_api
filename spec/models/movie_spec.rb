# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:box_office_mojo_id) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
