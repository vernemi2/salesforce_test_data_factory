module SalesforceTestDataFactory
  module Apex
    module Helper

      def self.remove_whitespaces name
        name.delete(" ")
      end
    end
  end
end
