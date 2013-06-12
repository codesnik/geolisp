#= require jquery.ui.sortable

$ ->
  $(".drop-target").sortable
    connectWith: ".drop-target"
    cursor: "move"
