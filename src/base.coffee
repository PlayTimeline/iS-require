define ['jquery', 'Backbone'], ($, B) ->
  return {
    say: (word) ->
      alert "hello require. --#{word}"
    findDom: (selector) ->
      console.info $(selector)
    showBackbone: () ->
      console.info B
  }