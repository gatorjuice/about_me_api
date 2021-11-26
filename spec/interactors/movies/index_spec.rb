# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Index, type: :interactor do
  subject(:context) { described_class.call(params) }

  let(:params) { { search: 'The Burbs' } }
  let(:movie1) { create(:movie) }
  let(:movie2) { create(:movie) }

  describe '.call' do
    let(:scraper) { instance_double(BoxOfficeMojo::MovieSearchScraper) }

    before { allow(BoxOfficeMojo::MovieSearchScraper).to receive(:new).and_return(scraper) }

    context 'when successful' do
      before { allow(scraper).to receive(:scrape).and_return([movie1, movie2]) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the favorite' do
        expect(context.movies).to match_array([movie1, movie2])
      end
    end

    context 'when failure' do
      before { allow(scraper).to receive(:scrape).and_raise(StandardError, 'an error message') }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'provides the error' do
        expect(context.error).to eq(['an error message'])
      end
    end
  end
end
