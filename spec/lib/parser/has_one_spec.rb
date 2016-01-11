require "pry"
$root = File.expand_path("../../../../", __FILE__)
require "#{$root}/spec/spec_helper"

describe Arav::Parser::HasOne do
  it "can deduce the associated class name or extract from class_name option" do
    code_lines = %{
      has_one :article_body
      has_one :article_info, :class_name => "ArticleInfo", :foreign_key => "article_id"
      has_one :award, :class_name => 'Article::Award', :foreign_key => 'article_id'
      has_one :pa_info, :class_name => "ArticlePaInfo", :foreign_key => "article_id"
      has_one :poll
      has_one :wam_guest
      has_one :whatif
      has_one :tweeted_article
      has_one :bottom_video, class_name: 'Article::BottomVideo', :foreign_key => 'article_id'
    }
    res = Arav::Parser::HasOne.new(code_lines).extract
    expect(res).to eq(["ArticleBody",
                      "ArticleInfo",
                      "Article::Award",
                      "ArticlePaInfo",
                      "Poll",
                      "WamGuest",
                      "Whatif",
                      "TweetedArticle",
                      "Article::BottomVideo"])
  end
end

