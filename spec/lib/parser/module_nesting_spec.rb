require "pry"
$root = File.expand_path("../../../../", __FILE__)
require "#{$root}/spec/spec_helper"

describe Arav::Parser::ModuleNesting do
  context "when a line of code is nested within modules" do
    it "determines the modules a line of code is nested in" do
      lines = [
        "module Foo\n",
        "module Bar\n",
        "def do nothing\n",
        "end\n"
        ]
      expect(Arav::Parser::ModuleNesting.new(lines).extract).to eq(["Foo", "Bar"])
    end
  end

  context "when a line of code is not nested in any modules" do
    it "returns an empty string" do
      lines = [
        "# some comment\n",
        "# some other comment\n",
        "def do nothing\n",
        "end\n"
        ]
      expect(Arav::Parser::ModuleNesting.new(lines).extract).to eq([])
    end
  end

  context "when a line of code is top of the file" do
    it "returns an empty string" do
      lines = [ ]
      expect(Arav::Parser::ModuleNesting.new(lines).extract).to eq([])
    end
  end
end

