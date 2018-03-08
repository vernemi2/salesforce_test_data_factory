require "restforce"

module SalesforceTestDataFactory
  module Salesforce
    class Client

      def initialize
        @client = Restforce.new
      end

      def sobject name
        sobject_describe = @client.describe name
        fields = sobject_describe.fields.select do |f|
          f.updateable && f.name != "OwnerId" && (!f.nillable || !f.referenceTo.empty? || f.custom)
        end
        Sobject.new sobject_describe.name, sobject_describe.label, fields
      end
    end
  end
end
