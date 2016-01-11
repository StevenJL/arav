require "pry"
$root = File.expand_path("../../../../", __FILE__)
require "#{$root}/spec/spec_helper"

describe Arav::Parser::BelongsTo do
  it "can deduce the associated class name or extract from class_name option" do
    code_lines = %{
      belongs_to :author, :class_name=>"User", :foreign_key=>'author_id', :counter_cache => true
      belongs_to :editor, :class_name=>'User', :foreign_key=>'assigned_to_editor_id'
      belongs_to :feed
      belongs_to :primary_image, class_name: "Image", :foreign_key=>'primary_image_id'
      belongs_to :photo_hook, class_name: 'Image', :foreign_key => 'photo_hook_id'
    }

    res = Arav::Parser::BelongsTo.new(code_lines).extract
    expect(res).to eq(["User", "User", "Feed", "Image", "Image"])
  end
end

