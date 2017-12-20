document.addEventListener("turbolinks:load", function(){
  const $infoDiv = $("div.car-show-info")
  const $prevCarButton = $("a#prev-car-button")
  const $nextCarButton = $("a#next-car-button")
  const initialUrlParams = parseURL()
  const initialID = parseInt(parseURL().id)
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
    //must stop it from going below zero
    const getReq = $.get(`/cars/${currentID}.json`)
    loadCarShowAjax(getReq, $infoDiv)
  })

  $nextCarButton.on("click", function(e){
    e.preventDefault()
    currentID = currentID+1
    //must stop it from going above max
    const getReq = $.get(`/cars/${currentID}.json`)
    loadCarShowAjax(getReq, $infoDiv)
  })

  function loadCarShowAjax(request, selectedDiv){
    request.done(function(response){
      let newHTML = ''

      newHTML += `<div><h1>${response.year} ${response.brand.name} ${response.name}</h1><a href="/cars/${currentID}/edit">Edit Car</a> <br> </div>
        <br>

        <img src="${response.photo_url}" alt="car photo" width="600" height="400" />
        <!-- would be cool to have a "added by" section  -->

          <p><strong>Brand: </strong> <a href="/brands/${response.brand_id}">${response.brand.name}</a></p>
          <h4>Types: </h4>
          <ul>`



      for (let t of response.car_types) {
        newHTML += `<li>${t.name}</li>`
      }
      newHTML += `
          </ul>

         <h4>Resources: </h4>
         <ul>`

      for (let r of response.resources){
        newHTML += `<li><a href="/cars/${currentID}/resources/${r.id}">${r.title}</a></li>`
      }

      newHTML += `</ul>
           <br>
            <a href="/cars/${currentID}/resources/new">Add Resource For This Car</a>
         </ul>

         <h4>Owners: 1</h4>
          <ul>`

      for (let o of response.users){
        newHTML += `<li>$<a href="/users/${o.id}">{o.username}</a></li>`
        //must stop names from duplicating
      }
      newHTML += `</ul>`
          selectedDiv.html(newHTML)
    })

  }

})
