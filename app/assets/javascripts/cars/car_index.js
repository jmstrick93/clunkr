document.addEventListener("turbolinks:load", function(){
  const $carListDiv =  $("body.index.cars div#car-index-list")

  let newCarListDivContents = ""

  $.get("/cars.json", function(response){
    for (let c of response){
      newCarListDivContents += `<div>
      <a href="/cars/${c.id}"><img src="${c.photo_url}" width="300" height="200" /></a>
      <p><a href="/cars/${c.id}">${c.year} ${c.brand.name} ${c.name}</a></p>
      <br></br>
    </div>`
    }
    $carListDiv.html(newCarListDivContents)
  })
})
