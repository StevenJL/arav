$:.unshift File.expand_path("../", __FILE__)

module Arav
  autoload :VERSION, "arav/version"
  autoload :CLI, "arav/cli"

  autoload :Main, "arav/main"
  autoload :ArModel, "arav/ar_model"
  autoload :Analyzer, "arav/analyzer"

  module Parser
    autoload :ModelInfo, "arav/parser/model_info"
    autoload :ModuleNesting, "arav/parser/module_nesting"
  end
end

