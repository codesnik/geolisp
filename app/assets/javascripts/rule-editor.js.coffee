#= require jquery.ui.sortable
#= require jquery.ui.droppable

# TODO
# * кансел
# * библиотека должна клонировать вытаскиваемые элементы
$ ->
  $(".drop-target").sortable
    connectWith: ".drop-target"
    cursor: "move"
    revert: 200

  $("#trash").droppable
    tolerance: 'pointer'
    drop: (event, ui) ->
      $(ui.draggable).fadeOut -> @remove()

  serializeResult = ->
    funcs = $('#rule-editor').find(':selected, :text').map (i, e) ->
      $(e).val()
    .get().join ' '

  setInterval ->
    $("#result").text serializeResult()
    console.debug "updated"
  , 1000
