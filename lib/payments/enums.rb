module Payments
  module Enums
    CURRENCIES = Hashie::Mash.new(shekel: 'shekel', dollar: 'dollar')
    PRICES_STRINGS = Hashie::Mash.new(shekel: '35₪', dollar: '10$')
  end
end
