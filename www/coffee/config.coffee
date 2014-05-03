require.config
  baseUrl: './',
  shim:
    jquery:
      exports: '$'
    happyjs:
      deps: ['jquery'],
      exports: 'Happy'
    happymethod:
      deps: ['happyjs'],
      exports: 'HappyMethod'
    bootstrap:
      deps: ['jquery'],
      exports: 'Boostrap'
    underscore:
      exports: '_'
    backbone:
      deps: ['jquery','underscore'],
      exports: 'Backbone'
    localstorage:
      deps: ['backbone'],
      exports: 'Backbone.LocalStorage'
  paths:
    jquery: 'lib/jquery/dist/jquery',
    happyjs: 'lib/Happyjs/happy',
    happymethod: 'lib/Happyjs/happy.methods',
    bootstrap: 'lib/bootstrap/dist/js/bootstrap'
    underscore: 'lib/underscore/underscore',
    backbone: 'lib/backbone/backbone',
    localstorage: 'lib/Backbone.localStorage/backbone.localStorage'

require ['jquery'],() ->
  $(document).ready () ->
    require ['js/main']