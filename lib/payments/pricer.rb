module Payments
  class Pricer
    include Enums

    attr_reader :currency

    def self.price_str(currency)
      pricer = Pricer.new currency
      pricer.price_str
    end

    def initialize(currency)
      @currency = currency
    end

    def price_str
      PRICES_STRINGS[currency]
    end
  end
end
