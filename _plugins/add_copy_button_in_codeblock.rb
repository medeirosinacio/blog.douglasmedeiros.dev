require 'nokogiri'

Jekyll::Hooks.register [:posts, :pages], :post_render do |doc|
  next unless doc.output_ext == ".html"
  fragment = Nokogiri::HTML.parse(doc.output)
  fragment.css('div.highlighter-rouge').each do |code_element|
    copy_btn = fragment.document.create_element('span')
    copy_btn['class'] = 'copy'
    copy_btn['data-bs-toggle'] = 'tooltip'
    copy_btn['title'] = 'Código copiado!'
    copy_btn.inner_html = '<i class="bi bi-copy"></i>'
    code_element.children.first.add_previous_sibling(copy_btn)
  end
  doc.output = fragment.to_html
end
