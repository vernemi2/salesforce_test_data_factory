module SalesforceTestDataFactory
  module Apex
    class ClassXml < ClassType

      API_VERSION = "42.0".freeze

      def initialize sobject, options={}
        super sobject, options
        @api_version = options[:api_version] || API_VERSION
      end

      def file_name
        name + ".cls-meta.xml"
      end

      def version
        @api_version
      end
    end
  end
end
