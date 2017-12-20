document.addEventListener("turbolinks:load", function(){
  const $infoDiv = $("div.car-show-info")
  const $prevCarButton = $("a#prev-car-button")
  const $nextCarButton = $("a#next-car-button")
  const initialUrlParams = parseURL()
  const initialID = parseURL().id
  let currentID = initialID
  //parse URL for info

  function parseURL(){
    let thePath = window.location.pathname.split("/")
    let pathObject = {}
    pathObject["object"]=thePath[1]
    pathObject["id"] = thePath[2]
    return pathObject
  }

  loadCarShowAjax($.get(`/cars/${currentID}.json`), $infoDiv)

  $prevCarButton.on("click", function(e){
    e.preventDefault()
    currentID = currentID-1
    const getReq = $.get(`/cars/${currentID}.json`)
    loadCarShowAjax($getReq, $infoDiv)
  })

  $nextCarButton.on("click", function(e){
    e.preventDefault()
    currentID = currentID+1
    const getReq = $.get(`/cars/${currentID}.json`)
    loadCarShowAjax($getReq, $infoDiv)
    alert("next car")
  })

  function loadCarShowAjax(request, selectedDiv){
    request.done(function(response){
      debugger;
      let newHTML = ''

      newHTML += `<div><h1>${response.year} ${response.brand.name} ${response.name}</h1><a href="/cars/${currentID}/edit">Edit Car</a> <br> </div>
        <br>

        <img src="${response.photo_url}" alt="car photo" width="600" height="400" />
        <!-- would be cool to have a "added by" section  -->

          <p><strong>Brand: </strong> <a href="/brands/${response.brand_id}">${response.brand.name}</a></p>
          <h4>Types: </h4>
          <ul>`



      for (let t of response.types) {
        newHTML += `<li>${t}</li>`
      }
      newHTML += `
          </ul>

         <h4>Resources: </h4>
         <ul>`

      for (let r of response.resources){
        newHTML += `<li>${r}</li>`
      }

      newHTML += `</ul>
           <!-- had to create custom route for this below; normal car_resource_path only designed to work when used from a car/1/resources kind of route; that one was mixing up the car id and the resource id -->
             <li><a href="/cars/1/resources/1">1969 Chevy Impala Owners Manual - manual</a></li>
           <!-- had to create custom route for this below; normal car_resource_path only designed to work when used from a car/1/resources kind of route; that one was mixing up the car id and the resource id -->
             <li><a href="/cars/1/resources/5">1969 Chevrolet Impala Custom Coupe Five-Speed - video</a></li>
           <br>
            <a href="/cars/${currentID}/resources/new">Add Resource For This Car</a>
         </ul>

         <h4>Owners: 1</h4>
          <ul>`

      for (let o of response.owners){
        newHTML += `<li>${o}</li>`
      }
      newHTML += `</ul>`
          selectedDiv.html(newHTML)
    })

  }

})
