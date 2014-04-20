require.config
  baseUrl: 'src/',
  shim:
    jquery:
      exports: '$'
    underscore:
      exports: '_'
    Backbone:
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
  paths:
    'jquery': '../bower_components/jquery/dist/jquery.min',
    'underscore': '../bower_components/underscore/underscore',
    'Backbone': '../bower_components/backbone/backbone'

require ['jquery', 'base', 'a', 'b', 'ab'], ($, base) ->
  $(document).ready () ->
    sayA()
    sayB()
    sayAB()
    base.say 'hehe'
    base.findDom 'body'
    base.showBackbone()