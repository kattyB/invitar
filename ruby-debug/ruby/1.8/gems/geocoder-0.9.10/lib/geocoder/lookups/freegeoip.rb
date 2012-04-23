require 'geocoder/lookups/base'
require 'geocoder/results/freegeoip'

module Geocoder::Lookup
  class Freegeoip < Base

    private # ---------------------------------------------------------------

    def result(query, reverse = false)
      # don't look up a loopback address, just return the stored result
      return reserved_result(query) if loopback_address?(query)
      begin
        if doc = fetch_data(query, reverse)
          doc
        end
      rescue StandardError # Freegeoip.net returns HTML on bad request
        nil
      end
    end

    def reserved_result(ip)
      {
        "ip"           => ip,
        "city"         => "",
        "region_code"  => "",
        "region_name"  => "",
        "metrocode"    => "",
        "zipcode"      => "",
        "latitude"     => "0",
        "longitude"    => "0",
        "country_name" => "Reserved",
        "country_code" => "RD"
      }
    end

    def query_url(query, reverse = false)
      "http://freegeoip.net/json/#{query}"
    end
  end
end
