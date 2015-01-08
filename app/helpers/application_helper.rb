module ApplicationHelper
    def active_class(which, sym)
        which == sym ? 'active' : ''
    end


    def icon_path(subpath, options = {})
        image_path "icons/#{ subpath }.png", options
    end


    def icon_tag(subpath, options = {})
        icon_class = ' icon'
        icon_class += ' black' if subpath.ends_with? '-black'
        icon_class += ' white' if subpath.ends_with? '-white'
        options[:class] = options.fetch(:class, '') + icon_class
        image_tag "icons/#{ subpath }.png", options
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


    def sm_icon_path(subpath, options = {})
        icon_path subpath + '-sm', options
    end


    def sm_icon_tag(subpath, options = {})
        icon_class = ' icon-sm'
        icon_class += ' black' if subpath.ends_with? '-black'
        icon_class += ' white' if subpath.ends_with? '-white'
        options[:class] = options.fetch(:class, '') + icon_class
        image_tag "icons/#{ subpath }-sm.png", options
    end


    def smooth_link_to(text, link, options = nil)
        options ||= {}
        options.deep_merge! data: { smooth: '' }
        link_to text, link, options
    end
end


class ActionView::Helpers::FormBuilder
    def error_msg(key)
        errs = @object.errors[key]
        @template.content_tag(:div, class: 'errors') do
            errs.empty? ? @template.raw('&nbsp;') : errs[0]
        end
    end
end

