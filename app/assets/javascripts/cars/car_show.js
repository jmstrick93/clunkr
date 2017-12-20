document.addEventListener("turbolinks:load", function(){
  const $infoDiv = $("div.car-show-info")
  const $prevCarButton = $("a#prev-car-button")
  const $nextCarButton = $("a#next-car-button")

  $prevCarButton.on("click", function(e){
    e.preventDefault()
    alert("prev car")
  })

  $nextCarButton.on("click", function(e){
    e.preventDefault()
    alert("next car")
  })

  debugger
})
