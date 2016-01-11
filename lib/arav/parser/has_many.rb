module Arav
  module Parser
    class HasMany < AssocBase
      
      private

      def assoc_regex_specified(assoc)
        /has_many\s*:#{assoc}\s*,\s*(?::class_name\s*=>\s*|class_name:\s*)(?:'|")(\S*)(?:'|")/
      end

      def has_many_assocs
        file.scan(has_many_regex)
      end

      def assoc_regex
        /has_many\s*:(\w*)\s*/ 
      end
    end
  end
end

