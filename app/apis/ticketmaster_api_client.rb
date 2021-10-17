# frozen_string_literal: true

# Integrates with the TicketMaster Discovery API.
# https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/
class TicketmasterApiClient
  BASE_URL = 'https://app.ticketmaster.com/discovery/v2/'
  INCLUDE_TEST = 'no'
  CACHE_EXP = 10.minutes
  MAX_RESULTS = 100

  def self.event_search(params = {})
    response = maybe_cached_response(params)
    parsed_response = JSON.parse(response.body).dig('_embedded', 'events')

    if response.success? && parsed_response
      parsed_response.map { |event_data| build_event(event_data) }
    else
      Rails.logger.info("\nNo events found for #{params.to_h.inspect}\n")

      []
    end
  end

  class << self
    private

    def maybe_cached_response(params)
      Rails.cache.fetch(
        [self, :maybe_cached_response, params.to_h.inspect],
        expires_in: CACHE_EXP,
        force: params[:bust_cache]
      ) do
        Rails.logger.info("\n#{self}: result from #{params.to_h.inspect} not cached, making call\n")
        http_client.get('events', query_params)
      end
    end

    def query_params(params)
      {
        'postalCode' => params[:zip_code],
        'size' => MAX_RESULTS
      }.compact
    end

    def build_event(event_data)
      {
        name: event_data['name'],
        source_id: event_data['id'],
        dates: event_data['dates'],
        sales: event_data['sales'],
        price_ranges: event_data['priceRanges']
      }
    end

    def http_client
      Faraday.new(BASE_URL) do |client|
        client.params = {
          'apikey' => ENV['TICKETMASTER_API_KEY'],
          'includeTest' => INCLUDE_TEST
        }
      end
    end
  end
end
