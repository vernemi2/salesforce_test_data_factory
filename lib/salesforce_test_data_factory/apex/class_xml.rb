module SalesforceTestDataFactory
  module Apex
    class ClassXml < Mustache

      FACTORY_NAME = "TestFactory_".freeze
      API_VERSION = "42.0".freeze

      def initialize sobject, options={}
        @api_version = options[:api_version] || API_VERSION
        @sobject = sobject
        @factory_name = options[:factory_name] || FACTORY_NAME
      end

      def name
        @factory_name + Helper.remove_whitespaces(@sobject.label)
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
