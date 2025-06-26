require 'minitest/autorun'
require 'jekyll'
require 'nokogiri'

require_relative '../_plugins/markdown_image_with_caption'

class TestMarkdownImageWithCaption < Minitest::Test
  def setup
    @site = Jekyll::Site.new(Jekyll.configuration({
      "source" => File.expand_path("test"),
      "destination" => File.expand_path("test/_site")
    }))
  end

  def test_image_attributes
    html = <<~HTML
      <div class="post-content">
        <img src="/image.png?class=test-class&data-id=123" alt="Example">
      </div>
    HTML

    doc = Jekyll::Document.new("test.md", { site: @site, collection: @site.posts })
    doc.output = html
    Jekyll::Hooks.trigger([:posts, :pages], :post_render, doc)

    fragment = Nokogiri::HTML.parse(doc.output)
    img = fragment.css('img').first

    assert_equal "test-class", img['class']
    assert_equal "123", img['data-id']
    assert_equal "Example", img['alt']
  end
end
