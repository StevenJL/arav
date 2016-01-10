module Arav
  class Analyzer
    attr_reader :filelines

    def initialize(filelines)
      @filelines = filelines
    end

    def analyze
      output = {lines_code: filelines.count}
      filelines.each_with_index do |line, index|
        output = analyze_line(output, line, index)
      end
      output 
    end

    private

    def analyze_line(output, line, index)
      model_attributes.map do |attr|
        extracted_data = extract(name, index)
        output.merge(extracted_data) if extracted_data
      end
      output
    end

#    {
#      model_info: {name: "User", parent: "ActiveRecord"},
#      has_one: ["UserInfo", "UserAddress"],
#      has_many: ["Pets"],
#      belongs_to: ["Accounts"]
#    }

    def extract(name, index)
      if index == 0
        prior_lines = []
      else
        prior_lines = filelines[0..(index-1)]
      end

      { "#{name}": Arav::Parser.const_get(camel_case(name)).new(line, prior_lines).extract }
    end

    def camel_case(symbol)
      symbol.to_s.split('_').collect(&:capitalize).join 
    end

    def model_attributes
      [:model_info, :has_one, :has_many, :belongs_to] 
    end
  end
end

