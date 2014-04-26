require.config({
  baseUrl: '../www',
  shim: {
    backbone: {
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
    },
    underscore: {
      exports: '_'
    }
  },
  paths: {
    jquery: 'lib/jquery/dist/jquery',
    underscore: 'lib/underscore/underscore',
    backbone: 'lib/backbone/backbone'
  }
});

require(['jquery'], function() {
  return $(document).ready(function() {
    return require(['js/main']);
  });
});