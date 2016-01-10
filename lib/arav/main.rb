module Arav
  class Main
    attr_reader :path

    def initialize(path)
      @path = ensure_forward_slash(path)
    end

    def perform
      models = []
       
      all_rb_files.each do |file| 
        models << Arav::ArModel.new(file).build
      end
    end

    private

    def all_rb_files
      Dir.glob("#{path}**/*").select {|file| ends_in_rb(file)}
    end

    def ends_in_rb(file)
      file.split(".").last == "rb"
    end

    def ensure_forward_slash(path)
      last_char = path.split("").last
      return path if last_char == "/"
      "#{path}/"
    end
  end
end

