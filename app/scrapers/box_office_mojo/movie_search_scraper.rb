# frozen_string_literal: true

module BoxOfficeMojo
  # Iterates over movie search results and parses movie data
  class MovieSearchScraper
    attr_reader :url, :document

    BASE_URL = 'https://www.boxofficemojo.com'
    TITLE = 'a.a-size-medium.a-link-normal.a-text-bold'
    MOVIES = 'div.a-fixed-left-grid-inner'
    CACHE_EXP = 1.day

    def initialize(url)
      @url = url
      @document = maybe_cached_page
    end

    def scrape
      document.css(MOVIES).map do |movie|
        uri = movie.css(TITLE)[0].attributes['href'].value.split('?')[0]
        url = URI.join(BASE_URL, uri, 'credits')

        BoxOfficeMojo::MovieScraper.new(url).scrape
      end
    end

    private

    def maybe_cached_page
      Nokogiri::HTML(
        Rails.cache.fetch([self.class.to_s.underscore, url.to_s], expires_in: CACHE_EXP) do
          html = URI.parse(url.to_s).open

          Nokogiri::HTML(html).serialize
        end
      )
    end
  end
end
