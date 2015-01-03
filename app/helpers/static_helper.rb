module StaticHelper
    def glossary_nav_link_to(letter)
        clazz = (@current_letter == letter ? 'current' : '')
        smooth_link_to letter, "#glossary-section-#{ letter }", class: clazz
    end


    def glossary_ref(word, id = nil)
        id = UnicodeUtils.downcase(word) if id.nil?
        link_to word, "#word-#{ id }", class: 'ref'
    end


    def glossary_section (letter, &blk)
        content_tag(:section, id: "glossary-section-#{ letter }", class: 'glossary-section') do
            render('static/essentials/glossary_nav.html.erb', current_letter: letter) +
            content_tag(:div, class: 'inner') do
                content_tag(:dl, &blk)
            end
        end
    end


    def glossary_word (word, id = nil, &blk)
        id = UnicodeUtils.downcase(word) if id.nil?
        content_tag(:dt, word, id: "word-#{ id }") +
        content_tag(:dd, &blk);
    end


    def heathenry_menu_link_to(category, name, text)
        clazz = (@active_article == name ? 'active' : '')
        link_to text, heathenry_path(category, name), class: clazz
    end
end
