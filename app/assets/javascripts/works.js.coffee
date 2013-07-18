# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  featured = ""
#init project
  $('.work-item').on click: ->
    
    projecturl = $(this).data("project")
    categories = $(this).find(".categories-total").html()
    categorySize = $(categories).siblings().length
    $(".category-title").html(categories)
    getProject projecturl
    getImg projecturl
    setModal projecturl
    

  setModal = (x) ->
    $(".project-link").attr "data-project", x




#set project preview 

  $('.project-link, .close-model-2').on click: ->
        addModal()
        $(".sections:first-child").addClass "active-title"

      addModal = -> 
        popVar = $(".project-link").attr "data-project"
        $("#page-container").css "overflow-y": "auto"
        $(".modal-bg").fadeToggle "slow", "linear"
        $(".modal-wrap").slideToggle "slow"        
        $(".w-modal-nav").toggleClass "visible"
        $(".modal-nav").toggleClass "table-center"

        popProject popVar

#post project in preview

  postImgPreview = (data, status) ->
    
    featured = $(data).find('.modal-image')
    $(".w-feat-img").hide().html(featured).fadeIn()
    return featured


  postInPreview = (data, status) ->
    $(".feat-desc").hide().html(data.subtitle).fadeIn()
    $(".feat-title").hide().html(data.name).fadeIn()


  getProject = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x + ".json"
      
      success: postInPreview

  getImg = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x
      success: postImgPreview


#post project modal

  postInModal = (data, status) ->
    indexer = 0
    $(".modal-title").hide().html(data.name).fadeIn()
    $(".modal-subtitle").hide().html(data.subtitle).fadeIn()
    $(".w-full-bleed").hide().html(featured).fadeIn()
    keys = ["post_a", "post_b", "post_c", "post_d"]
    val = []
    

    $.each keys, (i, key) ->
      val[i] = data[key]
      return val[i]

    $(".modal-main").hide().html(val[indexer]).fadeIn()
    $(".next").on click: ->
      
      if indexer is val.length-1
        indexer = 0
        $(".modal-main").hide().html(val[indexer]).fadeIn()
        
      else
        indexer++
        $(".modal-main").hide().html(val[indexer]).fadeIn()

      $active = $(".active-title", "h1")
      $nextElem = (if $active.next("span").length then $active.next("span") else $("h1").find("span:first"))
      $active.removeClass "active-title"
      $nextElem.addClass "active-title"
      #$(".modal-main").hide().html(val).fadeIn()

    $(".prev").on click: ->
      $active = $(".active-title", "h1")
      $prevElem = (if $active.prev("span").length then $active.prev("span") else $("h1").find("span:last"))
      $active.removeClass "active-title"
      $prevElem.addClass "active-title"



  popProject = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x + ".json"
      
      success: postInModal
    



  
    
  

  



    
    

 
    

