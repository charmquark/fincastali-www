# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LISTS = [
    {
        name:           'Heathen Hand Made',
        tag:            'handmade',
        description:    'Artisans and craftspersons'
    },
    {
        name:           'Heathen Music',
        tag:            'music',
        description:    'Heathen musicians and performing acts, or those involving heathens'
    }
]

List.create LISTS

handmade_list = List.find_by tag: 'handmade'


CATEGORIES = [
    {
        name:           'Art',
        description:    'Drawing, painting, sculpting, etc',
        list:           handmade_list
    },
    {
        name:           'Authors',
        description:    'Writers of both fiction and non-fiction',
        list:           handmade_list
    },
    {
        name:           'Clothing',
        description:    'Attire of all kinds',
        list:           handmade_list
    },
]

ListCategory.create CATEGORIES


ENTITIES = [
    {
        name:           'Beloved Viking Vinyl',
        description:    'Custom work, requests, vinyl wall quotes, car and truck decals, bumperstickers, business signs/hours/logos.',
        accepts_custom: true,
        urls:           "http://www.etsy.com/shop/BelovedVikingVinyl\nhttp://www.example.com?a_query#and-a-fragment"
    }
]

ListEntity.create ENTITIES

