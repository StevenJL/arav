module Arav
  module Parser
    class ModuleNesting
      attr_reader :filelines
      
      def initialize(filelines)
        @filelines = filelines
        @modules = []
      end

      def extract
        filelines.each do |line|
          if module_declaration?(line)
            @modules << extract_module_name(line) 
          end
        end
        @modules
      end

      private

      def extract_module_name(line)
        regex.match(line).captures.first
      end

      def module_declaration?(line)
        regex.match(line) 
      end

      def regex
        /^\s*module\s*(\w*)\s*$/
      end
    end
  end
end

