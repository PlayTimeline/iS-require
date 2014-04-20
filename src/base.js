define(['jquery', 'Backbone'], function($, B) {
  return {
    say: function(word) {
      return alert("hello require. --" + word);
    },
    findDom: function(selector) {
      return console.info($(selector));
    },
    showBackbone: function() {
      return console.info(B);
    }
  };
});
