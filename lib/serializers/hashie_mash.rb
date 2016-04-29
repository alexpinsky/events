module Serializers
  class HashieMash < Hashie::Mash
    def self.dump(obj)
      ActiveSupport::JSON.encode(obj.to_h)
    end


    def self.load(raw_hash)
      raw_hash ||= {}
      raw_hash = JSON.parse(raw_hash) if raw_hash.is_a? String
      new raw_hash
    end
  end
end
