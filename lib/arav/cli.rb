require "pry"
require "thor"

module Arav
  class CLI < Thor
    desc "generate PATH_TO_MODELS", "Generate model associations map"

    long_desc <<-LONG_DESC
    The `generate` command takes takes as argument the 
    path to the files of the project's active record models. 
    See example below:

    $ arav generate ~/src/rails_project/app/models/
    LONG_DESC

    def generate(path)
      Main.new(path).perform
    end
  end
end

