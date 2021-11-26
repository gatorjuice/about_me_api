# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookSerializer, type: :serializer do
  subject(:serialized_book) { JSON.parse(serialization.to_json) }

  let!(:book) { create(:book) }
  let!(:serializer) { described_class.new(book, favorites: favorites) }
  let!(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  describe 'serializer' do
    let(:expected) do
      {
        'id' => book.id,
        'title' => 'MyString',
        'author' => 'MyString',
        'page_count' => 1,
        'img_url' => 'MyString'
      }
    end

    context 'when book is not one of the users favorites' do
      let(:favorites) { [] }

      it 'serializes the book' do
        expect(serialized_book).to include(expected)
      end

      it 'sets is_favorite to false' do
        expect(serialized_book['is_favorite']).to eq(false)
      end
    end

    context 'when book is one of the users favorites' do
      let(:favorites) { [book] }

      it 'serializes the book' do
        expect(serialized_book).to include(expected)
      end

      it 'sets is_favorite to true' do
        expect(serialized_book['is_favorite']).to eq(true)
      end
    end
  end
end
