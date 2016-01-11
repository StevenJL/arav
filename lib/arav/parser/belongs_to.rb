module Arav
  module Parser
    class BelongsTo < AssocBase

      private

      def assoc_regex_specified(assoc)
        /belongs_to\s*:#{assoc}\s*,\s*(?::class_name\s*=>\s*|class_name:\s*)(?:'|")(\S*)(?:'|")/
      end

      def assoc_regex
        /belongs_to\s*:(\w*)\s*/
      end
    end
  end
end

