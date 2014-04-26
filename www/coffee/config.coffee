require.config
  baseUrl: '../www',
  shim:
    backbone:
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
    underscore:
      exports: '_'
  paths:
    jquery: 'lib/jquery/dist/jquery',
    underscore: 'lib/underscore/underscore',
    backbone: 'lib/backbone/backbone'

require ['jquery'], () ->
  $(document).ready () ->
    require ['js/main']