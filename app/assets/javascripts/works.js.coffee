# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  featured = ""

  $(".w-select-nav").one "click", (event) ->
    $('.project-link').addClass "inline-visible"

#init project
  $('.work-item').on click: () ->


    projecturl = $(this).data("project")
    categories = $(this).find(".categories-total").html()
    categorySize = $(categories).children().length
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
        popProjectImg popVar




#post project in preview

  postImgPreview = (data, status) ->
    
    featured = $(data).find('.modal-image-0').html()
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
    $(".w-full-bleed .featured").addClass "full-bleed"
    keys = ["post_a", "post_b", "post_c", "post_d"]
    val = []
    

    $.each keys, (i, key) ->
      if data[key]
        val[i] = data[key]
        return val[i]

    $(".modal-main").hide().html(val[indexer]).fadeIn()
    $(".next").on click: ->
      
      if indexer is val.length-1
        indexer = 0
        console.log indexer
        $(".modal-main").hide().html(val[indexer]).fadeIn()
        
      else
        indexer++
        console.log indexer
        $(".modal-main").hide().html(val[indexer]).fadeIn()

      $active = $(".active-title", "h1")
      $nextElem = (if $active.next("span").length then $active.next("span") else $("h1").find("span:first"))
      $active.removeClass "active-title"
      $nextElem.addClass "active-title"
      

    $(".prev").on click: ->

      if indexer is val.length-1
        indexer = 0
        $(".modal-main").hide().html(val[indexer]).fadeIn()
        
      else
        indexer--

        $(".modal-main").hide().html(val[indexer]).fadeIn()

      $active = $(".active-title", "h1")
      $prevElem = (if $active.prev("span").length then $active.prev("span") else $("h1").find("span:last"))
      $active.removeClass "active-title"
      $prevElem.addClass "active-title"


  postImgModal = (data, status) ->
    counter = 0
    children = $children = $(data).find(".project-img-container").children().filter(->
      not $(this).find("[alt=\"Missing\"]").length
    )

    console.log children
    imgVal = []

    $.each children, (i, child) ->
      imgVal[i] = child
      console.log imgVal[i]
      return imgVal[i]
      
    $(".next").on click: ->
      
      if counter is imgVal.length-1
        counter = 0
        console.log imgVal[counter]
        $(".w-full-bleed").hide().html(imgVal[counter]).fadeIn()
        $(".w-full-bleed .featured").addClass "full-bleed"

      else
        counter++
        console.log imgVal[counter]
        $(".w-full-bleed").hide().html(imgVal[counter]).fadeIn()
        $(".w-full-bleed .featured").addClass "full-bleed"



    $(".prev").on click: ->

      if counter is imgVal.length-1
        counter = 0
        console.log imgVal[counter]
        $(".w-full-bleed").hide().html(imgVal[counter]).fadeIn()
        $(".w-full-bleed .featured").addClass "full-bleed"

      else
        counter--
        console.log imgVal[counter]
        $(".w-full-bleed").hide().html(imgVal[counter]).fadeIn()
        $(".w-full-bleed .featured").addClass "full-bleed"


  popProject = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x + ".json"
      
      success: postInModal

  popProjectImg = (x) ->
    $.ajax
      type: "GET"
      url: "/works/" + x
      
      success: postImgModal


#navigation javascript

  li = $(".meny-ul li")
  li.on

    mouseenter: ->
      myindex = li.index(this)
      $(".quasi-meny li").eq(myindex).addClass "q-inside" unless $(this).hasClass("alive")

    mouseleave: ->
      $(".quasi-meny li").removeClass "q-inside"





  
    
  

  



    
    

 
    

