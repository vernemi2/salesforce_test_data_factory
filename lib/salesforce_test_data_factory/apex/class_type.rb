module SalesforceTestDataFactory
  module Apex
    class ClassType < Mustache

      FACTORY_NAME = "TestFactory_".freeze

      def initialize sobject, options={}
        @sobject = sobject
        @factory_name = options[:factory_name] || FACTORY_NAME
      end

      def name
        @factory_name + Helper.remove_whitespaces(@sobject.label)
      end
    end
  end
end
