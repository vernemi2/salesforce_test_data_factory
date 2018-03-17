module SalesforceTestDataFactory
  module Salesforce
    class Sobject

      attr_reader :name, :label, :fields

      def initialize name, label, fields
        @name = name.freeze
        @label = Helper.remove_whitespaces(label).freeze
        @fields = fields.freeze
      end

    end
  end
end
