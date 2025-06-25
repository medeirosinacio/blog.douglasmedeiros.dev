require 'nokogiri'

Jekyll::Hooks.register [:posts, :pages], :post_render do |doc|
  next unless doc.output_ext == ".html"
  fragment = Nokogiri::HTML.parse(doc.output)
  fragment.css('.post-content img').each do |img|
    src = img['src']
    alt = img['alt'] || ''
    next unless src

    if src.include?('?')
      query = src.split('?', 2)[1]
      query.split('&').each do |param|
        key, value = param.split('=', 2)
        if key == 'class' && value
          classes = value.split('%20').map { |c| c.tr('+', ' ') }
          img['class'] = [img['class'], *classes].compact.join(' ')
        end
      end
    end

    figure = fragment.document.create_element('figure')
    img.replace(figure)
    figure.add_child(img)
    caption = fragment.document.create_element('figcaption')
    caption.content = alt
    figure.add_child(caption)
  end
  doc.output = fragment.to_html
end
