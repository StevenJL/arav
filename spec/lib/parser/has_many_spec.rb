require "pry"
$root = File.expand_path("../../../../", __FILE__)
require "#{$root}/spec/spec_helper"

describe Arav::Parser::HasMany do
  it "can deduce the associated class name or extract from class_name option" do
    code_lines = %{
      has_many :editors, :class_name => 'User'
      has_many :revisions, class_name: 'Article::Revision'
      has_many :non_admin_editors, :class_name => 'User'
    }

    res = Arav::Parser::HasMany.new(code_lines).extract
    expect(res).to eq(["User", "Article::Revision", "User"])
  end
end

