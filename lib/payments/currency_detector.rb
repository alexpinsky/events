module Payments
  class CurrencyDetector
    include Enums

    attr_reader :accept_language_header

    def self.currency(accept_language_header)
      detector = CurrencyDetector.new accept_language_header
      detector.currency
    end

    def initialize(accept_language_header)
      @accept_language_header = accept_language_header
    end

    HEB_LANG = 'he'
    def currency
      return CURRENCIES.shekel if accept_language_header.include? HEB_LANG

      CURRENCIES.dollar
    end
  end
end
