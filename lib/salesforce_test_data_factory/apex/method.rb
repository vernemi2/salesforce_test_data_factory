module SalesforceTestDataFactory
  module Apex
    class Method

      def initialize line_spaces, name, body, return_stm="void", param=""
        @line_spaces = line_spaces
        @name = name
        @body = body
        @return_stm = return_stm
        @param = param
      end

      def create
        out = "#{@line_spaces}public static #{@return_stm} #{@name}(#{@param}) {\n\n"
        @body.each_line { |l| out << "#{@line_spaces}" * 2 << l}
        out << "#{@line_spaces}}\n"
      end
    end
  end
end
