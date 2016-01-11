module Arav
  class Analyzer
    attr_reader :filelines

    def initialize(filelines)
      @filelines = filelines
    end

    def analyze
      model_info = extract_model_info
      return unless model_info

      output = {
        lines_code: filelines.count,
        model_info: model_info,
        has_one: has_one,
        has_many: has_many,
        belongs_to: belongs_to
      }
    end

    private
    def belongs_to
      Arav::Parser::BelongsTo.new(filelines).extract
    end

    def has_many
      Arav::Parser::HasMany.new(filelines).extract
    end

    def has_one
      Arav::Parser::HasOne.new(filelines).extract
    end

    def extract_model_info
      # every file in app/models should only define one active record model
      # if more than one active record model is defined (bad Rails practice),
      # it returns the first one defined in the file
      
      filelines.each_with_index do |line, index|
        prior_lines = (index == 0) ? [] : filelines[0..(index-1)]
        if model_info = Arav::Parser::ModelInfo.new(line, prior_lines).extract
          return model_info
        end
      end

      # If no active record model is defined in the file, nil is returned
      # Again, this is bad Rails practice, there shouldn't be a file in
      # app/models that isn't an active record definition
      nil
    end

#    {
#      model_info: {name: "User", parent: "ActiveRecord"},
#      has_one: ["UserInfo", "UserAddress"],
#      has_many: ["Pets"],
#      belongs_to: ["Accounts"]
#    }

    def model_attributes
      [:model_info, :has_one, :has_many, :belongs_to] 
    end
  end
end

