require.config({
  baseUrl: 'bower_components/',
  shim: {
    jquery: {
      exports: '$'
    },
    underscore: {
      exports: '_'
    },
    Backbone: {
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
    }
  },
  paths: {
    'jquery': 'jquery/dist/jquery.min',
    'underscore': 'underscore/underscore',
    'Backbone': 'backbone/backbone'
  }
});

require(['../src/base'], function(base) {
  base.say('hehe');
  base.findDom('body');
  return base.showBackbone();
});
