#= require jquery.ui.sortable
#= require jquery.ui.droppable

# TODO
# * кансел
# * библиотека должна клонировать вытаскиваемые элементы
$ ->
  $(".fn-list").sortable
    connectWith: ".fn-list"
    cursor: "move"
    revert: 200

  $("#trash").droppable
    tolerance: 'pointer'
    drop: (event, ui) ->
      $(ui.draggable).fadeOut -> @remove()

  serializeNode = (node) ->
    "(" + (
      node.find(':selected').first().val() + ' ' +
        if node.find(".fn-list").length
          node.find(".fn-list").first().children().map (i, e) ->
            serializeNode($(e))
          .get().join(' ')
        else
          node.children(":hidden").val() + ' ' +
          node.children(":text").val()
      ) + ")"

  serializeResult = ->
    serializeNode($('#rule-editor .fn-list').first())

  setInterval ->
    $("#result").text serializeResult()
    console.debug "updated"
  , 1000
