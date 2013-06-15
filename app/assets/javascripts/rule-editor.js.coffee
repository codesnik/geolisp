#= require jquery.ui.sortable

$ ->
  $(".drop-target").sortable
    connectWith: ".drop-target"
    cursor: "move"

  $("#serialize").click ->
    funcs = $('#rule-editor').find(':selected, :text').map (i, e) ->
      $(e).val()
    .get().join ' '

    # funcs = funcs.get().join ' '
    alert funcs
