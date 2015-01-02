module ApplicationHelper
    def site_nav_link_to(name, text, link)
        clazz = (@active_site_nav == name ? 'active' : '')
        link_to text, link, class: clazz
    end
end
