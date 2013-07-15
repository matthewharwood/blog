# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
 
  postInPreview = (data, status) ->
   
    $(".feat-desc").hide().html(data.subtitle).fadeIn()

  getProject = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x + ".json"
      
      success: postInPreview

  $('.work-item').on click: ->
    projecturl = $(this).data("project")
    getProject projecturl