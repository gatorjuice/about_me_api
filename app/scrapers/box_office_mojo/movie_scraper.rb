# frozen_string_literal: true

module BoxOfficeMojo
  # Loads and parses movie data from the specific movie page.
  class MovieScraper < BoxOfficeMojo::MovieSearchScraper
    SUMMARY_ELEMENT_SELECTOR     = 'div.mojo-summary'
    PERFORMANCE_ELEMENT_SELECTOR = 'div.mojo-performance-summary-table'
    RELEASES_SELECTOR            = 'div.a-spacing-none'
    SUMMARY_SELECTOR             = 'span.a-size-medium'
    TITLE_SELECTOR               = 'h1.a-size-extra-large'
    REGION_SELECTOR              = 'span.a-size-small'
    MONEY_SELECTOR               = 'span.money'

    def self.scrape(url)
      html = URI.parse("#{BASE_URL}#{url}").open
      doc = Nokogiri::HTML(html)

      summary_element = doc.css(SUMMARY_ELEMENT_SELECTOR)
      performance_element = doc.css(PERFORMANCE_ELEMENT_SELECTOR).css(RELEASES_SELECTOR)

      parse_movie_elements(summary_element, performance_element)
    end

    class << self
      private

      def parse_movie_elements(summary_element, performance_element)
        {
          title: summary_element.css(TITLE_SELECTOR).text,
          summary: summary_element.css(SUMMARY_SELECTOR).text,
          performance: performance_element.each_with_index.map do |release, index|
            next if index.zero? # Required to keep unwanted joined element.

            parse_release(release)
          end.compact
        }
      end

      def parse_release(release)
        {
          region: release.css(REGION_SELECTOR).text.strip,
          money: release.css(MONEY_SELECTOR).text
        }
      end
    end
  end
end
