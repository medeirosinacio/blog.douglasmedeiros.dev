require 'nokogiri'

Jekyll::Hooks.register [:posts, :pages], :post_render do |doc|
  next unless doc.output_ext == ".html"
  fragment = Nokogiri::HTML.parse(doc.output)
  fragment.css('article blockquote').each do |bq|
    p = bq.at('p')
    if p
      html = p.inner_html.strip
      if html =~ /^\[!(\w+)\]/
        type_name = $1.downcase
        p.inner_html = html.sub(/^\[!\w+\]/, '').strip
        bq['class'] = [bq['class'], 'blockquote-alert', "blockquote-#{type_name}"].compact.join(' ')
      else
        bq['class'] = [bq['class'], 'blockquote-alert', 'blockquote-default'].compact.join(' ')
      end
    end
  end
  doc.output = fragment.to_html
end
