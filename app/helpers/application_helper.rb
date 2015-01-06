module ApplicationHelper
    def active_class(which, sym)
        which == sym ? 'active' : ''
    end

    def link_to_destroy(text, link, options = nil)
        options ||= {}
        options.deep_merge! method: :delete, data: {confirm: 'Are you sure?'}
        link_to text, link, options
    end

    def site_nav_link_to(name, text, link)
        clazz = (@active_site_nav == name ? 'active' : '')
        link_to text, link, class: clazz
    end

    def smooth_link_to(text, link, options = nil)
        options ||= {}
        options.deep_merge! data: { smooth: '' }
        link_to text, link, options
    end
end
