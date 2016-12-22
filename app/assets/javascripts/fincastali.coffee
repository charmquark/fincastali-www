window.Fincastali =
  components : {}
  controllers: {}
  $doc       : $ document
  $win       : $ window

  init: (controllerName, actionName)->
    console.info '[init]'
    controller = @controllers[controllerName]
    if controller?
      if controller.init?
        console.info "[controller #{controllerName}] init"
        controller.init()

      if controller[actionName]?
        console.log "[controller #{controllerName}] #{actionName}"
        controller[actionName]()

  initComponents: (names)->
    Fincastali.selectComponents names, (name, component)->
      if component.init?
        console.info "[component #{name}] init"
        component.init()

  matchComponent: (name, predicate)->
    $("[data-#{name}]").each ->
      $element = $ this
      config   = $element.data name
      predicate $element, config
  
  on: (eventName, dataKey, predicate)->
    @$doc.on eventName, "[data-#{dataKey}]", (event)->
      $element = $ event.currentTarget
      config   = $element.data dataKey
      predicate $element, config
  
  postInit: ->
    console.info '[init] post'
  
  preInit: ->
    console.info '[init] pre'

  selectComponents: (names, predicate)->
    for name in names
      component = Fincastali.components[name]
      predicate(name, component) if component?

Fincastali.$doc.on 'turbolinks:load', ->
  $body          = $ 'body'
  controllerName = $body.data 'controller'
  actionName     = $body.data 'action'
  Fincastali.preInit()
  Fincastali.init controllerName, actionName
  Fincastali.postInit()
  console.log '\n--------------------------------------------------\n'