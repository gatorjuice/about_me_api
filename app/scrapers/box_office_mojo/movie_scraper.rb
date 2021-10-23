# frozen_string_literal: true

module BoxOfficeMojo
  # Loads and parses movie data from the specific movie page.
  class MovieScraper < BoxOfficeMojo::MovieSearchScraper
    SUMMARY_ELEMENT     = 'div.mojo-summary'
    PERFORMANCE_ELEMENT = 'div.mojo-performance-summary-table'
    RELEASES            = 'div.a-spacing-none'
    SUMMARY             = 'span.a-size-medium'
    TITLE               = 'h1.a-size-extra-large'
    REGION              = 'span.a-size-small'
    MONEY               = 'span.money'
    MISC_VALUES_ELEMENT = 'div.mojo-summary-values.mojo-hidden-from-mobile'
    MISC_VALUES         = 'div.a-section.a-spacing-none'
    CREW_ELEMENT        = 'table#principalCrew'
    CAST_ELEMENT        = 'table#principalCast'
    CAST_DELIMITER      = 'See more'
    ROLE                = 'div.a-expander-content'
    SPAN                = 'span'
    TABLE_ROW           = 'tr'
    TABLE_DATA          = 'td'

    def scrape
      {
        title: css_dig(SUMMARY_ELEMENT, TITLE).text,
        summary: css_dig(SUMMARY_ELEMENT, SUMMARY).text,
        performance: parse_performance,
        crew: parse_crew,
        cast: parse_cast,
        misc: parse_misc
      }
    end

    private

    def parse_performance
      css_dig(PERFORMANCE_ELEMENT, RELEASES).each_with_index.map do |release, index|
        parse_release(release, index)
      end.compact
    end

    def parse_release(release, index)
      return if index.zero?

      {
        region: release.css(REGION).text.strip,
        money: release.css(MONEY).text
      }
    end

    def parse_misc
      css_dig(MISC_VALUES_ELEMENT, MISC_VALUES).each_with_object({}) do |key_and_value, hash|
        key, value = key_and_value.css(SPAN)

        maybe_update_hash(hash, key, value)
      end
    end

    def parse_crew
      css_dig(CREW_ELEMENT, TABLE_ROW).each_with_object({}) do |crew_and_role, hash|
        crew, role = crew_and_role.css(TABLE_DATA)

        maybe_update_hash(hash, role, crew)
      end
    end

    def parse_cast
      css_dig(CAST_ELEMENT, TABLE_ROW).each_with_object({}) do |cast_and_role, hash|
        cast, role = cast_and_role.css(TABLE_DATA)

        maybe_update_hash(hash, role&.css(ROLE), cast)
      end
    end

    def css_dig(*args, starting_at: document)
      args.reduce(starting_at) { |doc, arg| doc.css(arg) }
    end

    def maybe_update_hash(hash, key, value)
      return hash unless key && value

      hash[safe_to_string(key)] = safe_to_string(value)
      hash
    end

    def safe_to_string(element)
      element&.text&.squish || ''
    end
  end
end
