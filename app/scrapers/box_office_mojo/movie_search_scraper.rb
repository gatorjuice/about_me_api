# frozen_string_literal: true

module BoxOfficeMojo
  # Iterates over movie search results and parses movie data
  class MovieSearchScraper
    attr_reader :document

    BASE_URL = 'https://www.boxofficemojo.com'
    TITLE = 'a.a-size-medium.a-link-normal.a-text-bold'
    MOVIES = 'div.a-fixed-left-grid-inner'

    def initialize(url)
      html = URI.parse(url.to_s).open

      @document = Nokogiri::HTML(html)
    end

    def scrape
      document.css(MOVIES).map do |movie|
        uri = movie.css(TITLE)[0].attributes['href'].value.split('?')[0]
        url = URI.join(BASE_URL, uri, 'credits')

        Concurrent::Promise.execute do
          BoxOfficeMojo::MovieScraper.new(url).scrape
        end
      end.map(&:value!).flatten
    end
  end
end
