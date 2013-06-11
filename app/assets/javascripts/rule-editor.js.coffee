#= require jquery.ui.draggable
#= require jquery.ui.droppable

$ ->
  $(".drop-target").droppable()
  $(".logic, .function").draggable
    containment: "#rule-editor"
    revert: true
    cursor: 'move'
