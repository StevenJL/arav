require "pry"
$root = File.expand_path("../../../../", __FILE__)
require "#{$root}/spec/spec_helper"

describe Arav::Parser::ModelInfo do
  context "when it is not a model declaration" do
    it "returns nil" do
      expect(Arav::Parser::ModelInfo.new("# some comment", []).extract).to eq(nil)
    end
  end

  context "when it is a model declaration at top of file" do
    it "returns the model info" do
      expect(Arav::Parser::ModelInfo.new("  class User < ActiveRecord::Base\n", []).extract).to eq({name: "User", parent: "ActiveRecord::Base"})
    end
  end

  context "when it is a model declaration nested inside module" do
    it "returns the model info" do
      expect(Arav::Parser::ModelInfo.new("  class User < ActiveRecord::Base\n", ["module Foo\n", " module Bar\n"]).extract).to eq({name: "Foo::Bar::User", parent: "ActiveRecord::Base"})
    end
  end
  
  context "when it is a model declaration with colon-notation module" do
    it "returns the model info" do
      expect(Arav::Parser::ModelInfo.new("  class Accounts::Company::User < ActiveRecord::Base\n", []).extract).to eq({name: "Accounts::Company::User", parent: "ActiveRecord::Base"})
    end
  end
end

