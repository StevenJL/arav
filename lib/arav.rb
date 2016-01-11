$:.unshift File.expand_path("../", __FILE__)

module Arav
  autoload :VERSION, "arav/version"
  autoload :CLI, "arav/cli"

  autoload :Main, "arav/main"
  autoload :ArModel, "arav/ar_model"
  autoload :Analyzer, "arav/analyzer"

  autoload :Helper, "arav/helper.rb"

  module Parser
    autoload :AssocBase, "arav/parser/assoc_base"
    autoload :ModelInfo, "arav/parser/model_info"
    autoload :ModuleNesting, "arav/parser/module_nesting"
    autoload :HasOne, "arav/parser/has_one"
    autoload :HasMany, "arav/parser/has_many"
    autoload :BelongsTo, "arav/parser/belongs_to"
  end
end

