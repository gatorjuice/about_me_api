# frozen_string_literal: true

# Integrates with the TicketMaster Discovery API.
# https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/
class TicketmasterApiClient
  BASE_URL = 'https://app.ticketmaster.com/discovery/v2/'
  INCLUDE_TEST = 'no'
  CACHE_EXP = 10.minutes
  MAX_RESULTS = 100

  def self.event_search(params = {})
    key = cache_key(__method__, query_params(params))
    response = maybe_cached_response(key, params)
    parsed_response = JSON.parse(response.body).dig('_embedded', 'events')

    if response.success? && parsed_response
      parsed_response.map { |event_data| build_event(event_data) }
    else
      maybe_log_and_clean_cache(key)

      []
    end
  end

  class << self
    private

    def maybe_cached_response(key, params)
      Rails.cache.fetch(key, expires_in: CACHE_EXP, force: params[:bust_cache]) do
        Rails.logger.info("\n#{self}: result from #{key} not cached, making request\n")

        http_client.get('events', query_params(params))
      end
    end

    def cache_key(method_name, params)
      string_params = params.to_h.sort.map { |key, value| "#{key}=#{value}" }.join('&')

      [to_s.underscore, method_name, string_params].join('/')
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

    def maybe_log_and_clean_cache(key)
      return unless Rails.cache.fetch(key)

      Rails.logger.info("\nNo events found.\nDeleting Cached Key: #{key}\n")
      Rails.cache.delete(key)
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
