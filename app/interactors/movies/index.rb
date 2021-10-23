# frozen_string_literal: true

module Movies
  # Return Movies searched by title
  class Index
    include Interactor

    def call
      context.movies = BoxOfficeMojo::MovieSearchScraper.new(url).scrape
    rescue StandardError => e
      context.fail!(error: [e.message])
    end

    private

    def url
      URI.join(BoxOfficeMojo::MovieSearchScraper::BASE_URL, "search/?q=#{context.search}")
    end
  end
end
