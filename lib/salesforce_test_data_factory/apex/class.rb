module SalesforceTestDataFactory
  module Apex
    class Class < ClassType

      def file_name
        name + ".cls"
      end

      def object_name
        @sobject.name
      end

      def fields
        fields = []
        @sobject.fields.each do |f|
          field =  "#{f.name} = "
          if !f.referenceTo.empty?
            field << @factory_name + Helper.remove_whitespaces(f.relationshipName) << ".getDefault().Id"
          else
            puts "Field type: #{f.type}"
            case f.type
            when "currency", "integer", "double"
              field << "10 + i"
            when "string", "textarea"
              field << "\'Test\' + i"
            when "date"
              field << "System.today()"
            when "datetime"
              field << "System.now()"
            when "email"
              field << "\'test@test.com\' + i"
            when "url"
              field << "\'https://test.com\'"
            when "boolean"
              field << "true"
            when "picklist"
              active_values = f.picklistValues.select { |v| v.active }
              field << "\'#{active_values.first.value}\'" unless active_values.empty?
            else
              field << "\'\'"
            end
          end
          fields << {"field" => field}
        end
        fields
      end

    end
  end
end
