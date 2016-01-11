module Arav
  module Parser
    class ModelInfo
      attr_reader :line, :prior_lines
      
      def initialize(line, prior_lines)
        @line = line
        @prior_lines = prior_lines
      end

      def extract
        return unless class_declaration?

        {
          model_info: {
            name: name,
            parent: extract_parentname
          }
        }
      end

      private

      def name
        (module_nesting + [extract_classname]).join("::") 
      end

      def extract_classname
        regex.match(line).captures.first 
      end

      def extract_parentname
        regex.match(line).captures[1]
      end

      def class_declaration?
        regex.match(line) 
      end

      def regex
        /^\s*class\s*(\S*)\s*<\s*(\S*)\s*$/ 
      end

      def module_nesting
        Arav::Parser::ModuleNesting.new(prior_lines).extract 
      end
    end
  end
end

