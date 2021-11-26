# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserBook, type: :model do
  # relationships
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:book) }
end
