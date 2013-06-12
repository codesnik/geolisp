#= require jquery.ui.draggable
#= require jquery.ui.droppable

$ ->
  $(".drop-target").droppable
    accept: '.logic, .function'
    hoverClass: 'visible-target'
    greedy: true

  $(".logic, .function").draggable
    containment: "#rule-editor"
    revert: 'invalid'
    cursor: 'move'

    #opacity: 0.7
    #helper: "clone"
    zIndex: 100
    #start: ->
    #  $(".drop-target").addClass "visible-target"
    #stop: ->
    #  $(".drop-target").removeClass "visible-target"
