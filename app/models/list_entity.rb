class ListEntity < ActiveRecord::Base
    has_many    :listings   , dependent: :destroy   , inverse_of: :entity   , foreign_key: :entity_id

    validates :name,
        presence: true

    validates :description,
        presence: true

    validates :urls,
        presence: true


    module Utils
        def self.display_text_for_url(url)
            parsed = URI(url)
            host = parsed.host.split /\./
            host.shift if host[0] == 'www'
            query = (parsed.query.nil?) ? '' : "<span class=\"query\">?#{ parsed.query }</span>"
            fragment = (parsed.fragment.nil?) ? '' : "<span class=\"fragment\">##{ parsed.fragment }</span>"
            "#{ host.join '.' }#{ parsed.path }#{ query }#{ fragment }"
        end
    end
end
