# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  # validations
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:description) }

  # relationships
  it { is_expected.to belong_to(:user) }
end
