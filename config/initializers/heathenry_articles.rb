
module HeathenryCollection
    @@instance = nil


    class Article
        attr_reader :key, :title

        def initialize(a_key, a_title)
            @key    = a_key.to_sym
            @title  = a_title
        end
    end


    class Category
        attr_reader :key, :display, :articles

        def initialize(a_key, a_display)
            @key        = a_key.to_sym
            @display    = a_display

            @articles   = []
            @map        = {}
        end

        def add(art)
            @articles << art
            @map[art.key] = art
        end

        def [](key)
            @map[key]
        end
    end


    class Collection
        attr_reader :categories

        def initialize
            @categories = []
            @map        = {}
        end

        def add(cat)
            @categories << cat
            @map[cat.key] = cat
        end

        def [](key)
            @map[key]
        end
    end


    def self.instance
        if @@instance.nil? then
            collection = @@instance = Collection.new

            yml = YAML.load IO.read('config/app/heathenry_articles.yml')
            yml.keys.each do |cat_key|
                ycat = yml[cat_key]
                category = Category.new cat_key, ycat['display']
                collection.add category

                ylist = ycat['articles']
                ylist.keys.each do |art_key|
                    article = Article.new art_key, ylist[art_key]
                    category.add article
                end
            end
        end
        @@instance
    end
end

