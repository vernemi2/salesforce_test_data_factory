module SalesforceTestDataFactory
  module Salesforce
    class Sobject

      attr_reader :name, :label, :fields

      def initialize name, label, fields
        @name = name.freeze
        @label = label.delete " ".freeze
        @fields = fields.freeze
      end

    end
  end
end
