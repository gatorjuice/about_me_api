# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age).only_integer }

    it 'validates associated favorites' do
      expect(build(:user, :with_invalid_favorite)).to be_invalid
    end
  end

  describe 'friendships' do
    it { is_expected.to accept_nested_attributes_for :favorites }
    it { is_expected.to have_many(:favorites).dependent(:destroy) }
  end
end
