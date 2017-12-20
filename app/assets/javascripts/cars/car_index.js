document.addEventListener("turbolinks:load", function(){
  const $carListDiv =  $("body.index.cars div#car-index-list")
  const $filterButton = $("body.index.cars input.filter-submit")
  const $filterForm = $("body.index.cars form.filter-form")

  $filterForm.on("submit", function(e){
    e.preventDefault()
    let values = $(this).serialize()
    $.get('/cars.json', values).done(function(resp){
      loadCarsIndexAjax()
    })
  })

  loadCarsIndexAjax()

})


function loadCarsIndexAjax(getRequest){

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
}
