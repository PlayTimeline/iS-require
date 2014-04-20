define ['jquery', 'Backbone'], ($, B) ->
  return {
    say: (word) ->
      alert "hello every one. --#{word}"
    findDom: (selector) ->
      console.info $(selector)
    showBackbone: () ->
      console.info B
  }