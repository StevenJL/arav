require "pry"
$root = File.expand_path("../../../", __FILE__)
require "#{$root}/spec/spec_helper"

describe Arav::Main do
  it "tacks on a forward slash to path if absent" do
    main = Arav::Main.new("~/src/rails_project/app/models") 
    expect(main.path).to eq("~/src/rails_project/app/models/")
  end

  it "checks if files end in .rb" do
    expect(Arav::Main.new("some_path/").send(:ends_in_rb, "foo/bar.rb")).to eq(true)
    expect(Arav::Main.new("some_path/").send(:ends_in_rb, "foo/bar")).to eq(false)
  end
end

