# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).on "page:change", ->
#   $('.checkbox').click (event) ->
#     event.preventDefault()
#     $('i.fa-check').fadeIn()
#     setTimeout 2000

# $('.checkbox').click ->
#     # alert $(this).find('i').class()
$ ->
  $('body').on 'click', '.checkbox', ->
    console.log 'clicked'
    $(this).find('i').addClass 'show'
    return