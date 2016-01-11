module Arav
  module Parser
    class AssocBase
      attr_reader :file 

      def initialize(file)
        @file = file
      end

      def extract
        return unless has_assoc_declaration?

        assocs.map {|assoc| validate_class_name(assoc.first)}
      end

      private

      def validate_class_name(assoc)
        re_match = assoc_regex_specified(assoc).match(file)
        return Arav::Helper.camel_case(assoc.to_s) unless re_match
        re_match.captures.first
      end
 
      def assocs
        file.scan(assoc_regex)
      end

      def has_assoc_declaration?
        assoc_regex =~ file
      end
    end
  end
end

