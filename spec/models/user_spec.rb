# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:password_digest) }
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_numericality_of(:age).only_integer }

  it 'validates associated favorites' do
    expect(build(:user, :with_invalid_favorite)).to be_invalid
  end

  # relationships
  it { is_expected.to accept_nested_attributes_for :favorites }
  it { is_expected.to have_many(:favorites).dependent(:destroy) }
  it { is_expected.to have_many(:user_books).dependent(:destroy) }
  it { is_expected.to have_many(:books).through(:user_books) }
  it { is_expected.to have_many(:funny_bot_messages).dependent(:destroy) }
  it { is_expected.to have_many(:todos).dependent(:destroy) }
end
