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
    this.car_types = attributes.car_types
    this.resources = attributes.resources
    this.users = attributes.users
  }

  renderIndexInfo(){
    if (!!Car.indexTemplate){
      return Car.indexTemplate(this)
    }
  }

  renderShowInfo(){
    if (!!Car.showTemplate){
      return Car.showTemplate(this)
    }
  }
}

document.addEventListener("turbolinks:load", function(){
  const $carIndexListDiv =  $("body.index.cars div#car-index-list")
  const $filterButton = $("body.index.cars input.filter-submit")
  const $filterForm = $("body.index.cars form.filter-form")
  const $showInfoDiv = $("div.car-show-info")
  const $prevCarButton = $("button#prev-car-button")
  const $nextCarButton = $("button#next-car-button")
  const initialUrlParams = parseURL()
  const initialID = parseInt(parseURL().id)
  let currentID = initialID // at beginning, sets "currentID" variable once


  let numberOfCars //set in this scope so that the below request can change it.
  $.get("/cars.json")
    .done(function(response){
      numberOfCars = response.length
    })

  Car.indexTemplateSource = $("#car-index-template").html();
  if (!!Car.indexTemplateSource) {
    Car.indexTemplate = Handlebars.compile(Car.indexTemplateSource);
  }
  if ($carIndexListDiv.length > 0){
    loadCarsIndexAjax($.get("/cars.json"))
  }


  Car.showTemplateSource = $("#car-show-template").html();
  if (!!Car.showTemplateSource){
    Car.showTemplate = Handlebars.compile(Car.showTemplateSource)
  }
  if ($showInfoDiv.length > 0){
    loadCarShowAjax($.get(`/cars/${currentID}.json`), $showInfoDiv)
  }




  $filterForm.submit(function(e){
    e.preventDefault()
    let values = $(this).serialize() //here, 'this' is the form element
    debugger;
    let carList = $.get('/cars.json', values)
    loadCarsIndexAjax(carList)
  })


  function loadCarsIndexAjax(getRequest){
    getRequest.done(function(response){
      let newCarIndexList = ""
      for (let c of response){
        let cObj = new Car(c)
        newCarIndexList += cObj.renderIndexInfo()
      }
      $carIndexListDiv.html(newCarIndexList)
    })
  }

  function loadCarShowAjax(request, selectedDiv){
    request.done(function(response){
      let carObj = new Car(response)
      $showInfoDiv.html(carObj.renderShowInfo())
    })
  }

    function parseURL(){
      let thePath = window.location.pathname.split("/")
      let pathObject = {}
      pathObject["object"]=thePath[1]
      pathObject["id"] = thePath[2]
      return pathObject
    }

    $prevCarButton.on("click", function(e){
      e.preventDefault()
        if (currentID > 1){
          currentID = currentID-1
          //must stop it from going below zero
          const getReq = $.get(`/cars/${currentID}.json`)
          loadCarShowAjax(getReq, $showInfoDiv)
          getReq.done(function(resp){
            if (!(currentID > 1)){
              //disables the "previous car" button if there is no prev car
              $prevCarButton.prop("disabled", true)
            } else {
              $prevCarButton.prop("disabled", false)
              $nextCarButton.prop("disabled", false)
            }
          })
        }
    })

    $nextCarButton.on("click", function(e){
      e.preventDefault()
      if ((currentID < numberOfCars)){
        //global currentID value keeps track of
        currentID = currentID+1
      //must stop it from going above max
        const getReq = $.get(`/cars/${currentID}.json`)
        loadCarShowAjax(getReq, $showInfoDiv)
        getReq.done(function(resp){
          if (!(currentID < numberOfCars)){
            //disables next car button if there is no next car
            $nextCarButton.prop("disabled", "true")
          } else {
            $prevCarButton.prop("disabled", false)
            $nextCarButton.prop("disabled", false)
          }
        })
      }
    })

    Handlebars.registerHelper("debug", function(optionalValue) {
    console.log("Current Context");
    console.log("====================");
    console.log(this);

    if (optionalValue) {
      console.log("Value");
      console.log("====================");
      console.log(optionalValue);
    }
  });
  console.log(numberOfCars)
})
