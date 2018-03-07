module SalesforceTestDataFactory
  module Apex
    class Class

      attr_reader :name

      FACTORY_NAME = "TestFactory_".freeze
      LINE_SPACES = "    "
      API_VERSION = "42.0".freeze

      def initialize sobject, options={}
        @sobject = sobject
        @factory_name = options[:factory_name] || FACTORY_NAME
        @line_spaces = options[:line_spaces] || LINE_SPACES
        @api_version = options[:api_version] || API_VERSION
        @name = "#{@factory_name}" << @sobject.label.delete(" ")
      end

      def create
        out = "@IsTest\n"
        out << "private class #{@name} {\n"
        out << "\n"
        out << "#{@line_spaces}static #{@sobject.name} defaultObject;\n"
        out << "#{@line_spaces}static List<#{@sobject.name}> defaultObjects;\n"

        methods.each do |m|
          out << "\n"
          out << m.create
        end

        out << "\n}"
      end

      def create_xml_file

        out = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
        out << "<ApexClass xmlns=\"http://soap.sforce.com/2006/04/metadata\">\n"
        out << "#{@line_spaces}<apiVersion>#{@api_version}</apiVersion>\n"
        out << "#{@line_spaces}<status>Active</status>\n"
        out << "</ApexClass>"
      end

      private
        def methods

          out = []
          out << default_method
          out << defaults_method
          out << build_i_method
          out << build_method
          out << builds_method
          out << insert_method
          out << inserts_method
          out << inserts_i_method
        end

        def default_method

          body = "if (defaultObject == null) {\n"
          body_1 = "try {\n"
          body_1 << "#{@line_spaces}defaultObject = [SELECT Id FROM #{@sobject.name} LIMIT 1][0];\n"
          body_1 << "} catch (Exception e) {\n"
          body_1 << "#{@line_spaces}defaultObject = insertObject();\n"
          body_1 << "}\n"
          body_1.each_line { |l| body << "#{@line_spaces}" << l }
          body << "}\n"
          body << "return defaultObject;\n"

          method = Method.new @line_spaces, "getDefault", body, @sobject.name
        end

        def defaults_method

          body = "if (defaultObjects == null) {\n"
          body_1 = "defaultObjects = [SELECT Id FROM #{@sobject.name}];\n"
          body_1 << "if (defaultObjects.isEmpty()) {\n"
          body_1 << "#{@line_spaces}defaultObjects = insertObjects(201);\n"
          body_1 << "}\n"
          body_1.each_line { |l| body << "#{@line_spaces}" << l }
          body << "}\n"
          body << "return defaultObjects;\n"

          method = Method.new @line_spaces, "getDefaults", body, "List<#{@sobject.name}>"
        end

        def build_i_method

          body = "#{@sobject.name} out = new #{@sobject.name}(\n"
          body_1 = ""
          @sobject.fields.each do |f|
            body_1 << "#{f.name} = "
            if !f.referenceTo.empty?
              body_1 << "#{@factory_name}" << f.relationshipName.delete(" ") << ".getDefault(),\n"
            else
              case f.type
              when "currency" || "integer" || "double"
                body_1 << "10 + i,"
              when "string" || "textarea"
                body_1 << "\'Test\' + i,"
              when "date"
                body_1 << "System.today(),"
              when "datetime"
                body_1 << "System.now(),"
              when "email"
                body_1 << "\'test@test.com\' + i,"
              when "url"
                body_1 << "\'https://test.com\',"
              else
                body_1 << "\'\',"
              end
              body_1 << "\n"
            end
          end
          body_1.chomp! ",\n"
          body_1 << "\n"

          body_1.each_line { |l| body << "#{@line_spaces}" * 2 << l }
          body << ");\n"
          body << "return out;\n"

          method = Method.new @line_spaces, "buildObject", body, @sobject.name, "Integer i"
        end

        def build_method

          body = "return buildObject(-1);\n"

          method = Method.new @line_spaces, "buildObject", body, @sobject.name, ""
        end

        def builds_method

          body = "List<#{@sobject.name}> out = new List<#{@sobject.name}>();\n"
          body << "for (Integer i = 0; i < noOfObjects; i++) {\n"
          body << "#{@line_spaces}out.add(buildObject(i));\n"
          body << "}\n"
          body << "return out;\n"

          method = Method.new @line_spaces, "buildObjects", body, "List<#{@sobject.name}>", "Integer noOfObjects"
        end

        def insert_method

          body = "#{@sobject.name} out = buildObject();\n"
          body << "insert out;\n"
          body << "return out;\n"

          method = Method.new @line_spaces, "insertObject", body, @sobject.name, ""
        end

        def inserts_method

          body = "insert objects;\n"
          body << "return objects;\n"

          method = Method.new @line_spaces, "insertObjects", body, "List<#{@sobject.name}>", "List<#{@sobject.name}> objects"
        end

        def inserts_i_method

          body = "return insertObjects(buildObjects(noOfObjects));\n"

          method = Method.new @line_spaces, "insertObjects", body, "List<#{@sobject.name}>", "Integer noOfObjects"
        end
    end
  end
end
