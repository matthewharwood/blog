# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  

  postInPreview = (data, status) ->
   
    $(".feat-desc").hide().html(data.subtitle).fadeIn()
    $(".feat-title").hide().html(data.name).fadeIn()
    console.log data

  getProject = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x + ".json"
      
      success: postInPreview

  popProject = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x + ".json"
      
      success: postInModal


  $('.work-item').on click: ->
    
    projecturl = $(this).data("project")
    getProject projecturl
    setModal projecturl
    categories = $(this).find(".categories-total ").html()
    $(".category-title").html(categories)
    #splitString (categories)

#modal placement

  postInModal = (data, status) ->
    $(".modal-title").hide().html(data.name).fadeIn()
    $(".modal-subtitle").hide().html(data.subtitle).fadeIn()

    $(".next").on click: ->
      $active = $(".active-title", "h1")
      $nextElem = (if $active.next("span").length then $active.next("span") else $("h1").find("span:first"))
      $active.removeClass "active-title"
      $nextElem.addClass "active-title"

    $(".prev").on click: ->
      $active = $(".active-title", "h1")
      $prevElem = (if $active.prev("span").length then $active.prev("span") else $("h1").find("span:last"))
      $active.removeClass "active-title"
      $prevElem.addClass "active-title"

  

  
    

  $('.project-link, .close-model-2').on click: ->
    addModal()
    $(".sections:first-child").addClass "active-title"

  setModal = (x) ->
    $(".project-link").attr "data-project", x
    

  addModal = -> 
    popVar = $(".project-link").attr "data-project"
    $("#page-container").css "overflow-y": "auto"
    $(".modal-bg").fadeToggle "slow", "linear"
    $(".modal-wrap").slideToggle "slow"
    
    $(".w-modal-nav").toggleClass "visible"
    $(".modal-nav").toggleClass "table-center"

    popProject popVar

  



    
    

 
    

