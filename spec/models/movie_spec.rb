# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:box_office_mojo_id) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:summary) }
    it { is_expected.to validate_presence_of(:performance) }
    it { is_expected.to validate_presence_of(:crew) }
    it { is_expected.to validate_presence_of(:cast) }
    it { is_expected.to validate_presence_of(:misc) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
