$(".switchtext").click ->
  $selected = $(".selected").removeClass("selected")
  divs = $selected.parent().children()
  divs.eq((divs.index($selected) + 1) % divs.length).hide().addClass("selected").fadeIn()
