# frozen_string_literal: true

module BoxOfficeMojo
  class MovieSearchScraper
    BASE_URL = 'https://www.boxofficemojo.com'
    TITLE_SELECTOR = 'a.a-size-medium.a-link-normal.a-text-bold'
    MOVIES_SELECTOR = 'div.a-fixed-left-grid-inner'

    def self.scrape(query)
      html = URI.parse("#{BASE_URL}/search/?q=#{query}").open

      Nokogiri::HTML(html).css(MOVIES_SELECTOR).map do |movie|
        movie_url = movie.css(TITLE_SELECTOR)[0].attributes['href'].value

        Concurrent::Promise.execute do
          BoxOfficeMojo::MovieScraper.scrape(movie_url)
        end
      end.map(&:value!).flatten
    end
  end
end
