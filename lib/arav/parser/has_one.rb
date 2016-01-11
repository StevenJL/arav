module Arav
  module Parser
    class HasOne < AssocBase
      private

      def assoc_regex_specified(assoc)
        /has_one\s*:#{assoc}\s*,\s*(?::class_name\s*=>\s*|class_name:\s*)(?:'|")(\S*)(?:'|")/
      end

      def assoc_regex
        /has_one\s*:(\w*)\s*/
      end
    end
  end
end

