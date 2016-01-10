module Arav
  class ArModel
    attr_reader :filepath

    def initialize(filepath)
      @filepath = filepath
    end

    def build
      Arav::Analzyer.new(filelines).analyze
    end

    private

    def filelines
      file = File.new(filepath)
      output = []
      while(line = file.gets)
        output << line 
      end
      output
    end
  end
end

