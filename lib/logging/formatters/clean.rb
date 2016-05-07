module Logging
  module Formatters
    class Clean < ActiveSupport::Logger::Formatter

      def call(severity, timestamp, progname, message)
        "#{message}\n"
      end
    end
  end
end
