class Car {
  constructor(attributes){
    this.id = attributes.id
    this.name = attributes.name
    this.brand_id = attributes.brand_id
    this.year = attributes.year
    this.photo_url = attributes.photo_url
    this.created_at = attributes.created_at
    this.updated_at = attributes.updated_at
    this.brand = attributes.brand
  }

  renderIndexInfo(){
    return Car.indexTemplate(this)
  }
}

document.addEventListener("turbolinks:load", function(){
  const $carListDiv =  $("body.index.cars div#car-index-list")
  const $filterButton = $("body.index.cars input.filter-submit")
  const $filterForm = $("body.index.cars form.filter-form")


  Car.indexTemplateSource = $("#car-index-template").html();

  Car.indexTemplate = Handlebars.compile(Car.indexTemplateSource);

  Car.showTemplateSource = $("#car-show-template")

  loadCarsIndexAjax($.get("/cars.json"))

  $filterForm.submit(function(e){
    e.preventDefault()
    let values = $(this).serialize()
    let carList = $.get('/cars.json', values)
    loadCarsIndexAjax(carList)
  })


  function loadCarsIndexAjax(getRequest){
    let newCarListDivContents = ""
    getRequest.done(function(response){
    })
  }

})
