# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateFavorite, type: :interactor do
  subject(:context) { described_class.call(params) }

  let(:params) do
    {
      user: create(:user),
      favorite_params: {
        category: category,
        description: description
      }
    }
  end

  describe '.call' do
    context 'when successful' do
      let(:category) { 'drink' }
      let(:description) { 'coke' }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the favorite' do
        expect(context.favorite).to be_a_kind_of(Favorite)
      end
    end

    context 'when bad category' do
      let(:category) { 'horse' }
      let(:description) { 'pony' }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'provides the message' do
        expect(context.message).to eq(["'horse' is not a valid category"])
      end
    end
  end
end
