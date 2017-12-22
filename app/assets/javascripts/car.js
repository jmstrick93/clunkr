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
    //WHY DOES INDEXTEMPLATE TAKE (THIS) AS AN ARGUMENT BELOW?!?!
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
  const $prevCarButton = $("a#prev-car-button")
  const $nextCarButton = $("a#next-car-button")
  const initialUrlParams = parseURL()
  const initialID = parseInt(parseURL().id)
  let currentID = initialID


  Car.indexTemplateSource = $("#car-index-template").html();
  if (!!Car.indexTemplateSource) {
    Car.indexTemplate = Handlebars.compile(Car.indexTemplateSource);
  }


  Car.showTemplateSource = $("#car-show-template").html();
  if (!!Car.showTemplateSource){
    Car.showTemplate = Handlebars.compile(Car.showTemplateSource)
  }

  if ($carIndexListDiv.length > 0){
    debugger;
  loadCarsIndexAjax($.get("/cars.json"))
  }

  if ($showInfoDiv.length > 0){
    loadCarShowAjax($.get(`/cars/#{currentID}`),$showInfoDiv)
  }

  $filterForm.submit(function(e){
    e.preventDefault()
    let values = $(this).serialize()
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
    request.success(function(response){
      let carObj = new Car(response)
      debugger;
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
      }
    })
    $nextCarButton.on("click", function(e){
      e.preventDefault()
      currentID = currentID+1
      //must stop it from going above max
      const getReq = $.get(`/cars/${currentID}.json`)
      loadCarShowAjax(getReq, $showInfoDiv)
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
})



//stubbed out old file below

//
// document.addEventListener("turbolinks:load", function(){
//   const $infoDiv = $("div.car-show-info")
//   const $prevCarButton = $("a#prev-car-button")
//   const $nextCarButton = $("a#next-car-button")
//   const initialUrlParams = parseURL()
//   const initialID = parseInt(parseURL().id)
//   let currentID = initialID
//   //parse URL for info
//
//   function parseURL(){
//     let thePath = window.location.pathname.split("/")
//     let pathObject = {}
//     pathObject["object"]=thePath[1]
//     pathObject["id"] = thePath[2]
//     return pathObject
//   }
//
//   s
//
//   $prevCarButton.on("click", function(e){
//     e.preventDefault()
//       if (currentID > 1){
//       currentID = currentID-1
//       //must stop it from going below zero
//       const getReq = $.get(`/cars/${currentID}.json`)
//       loadCarShowAjax(getReq, $infoDiv)
//     }
//   })
//
//   $nextCarButton.on("click", function(e){
//     e.preventDefault()
//     currentID = currentID+1
//     //must stop it from going above max
//     const getReq = $.get(`/cars/${currentID}.json`)
//     loadCarShowAjax(getReq, $infoDiv)
//   })
//
// //copy/pasted from https://codehandbook.org/how-to-remove-duplicates-from-javascript-array/ with some edits
//   function removeDuplicateUsingFilter(arr){
//     let unique_array = arr.filter((elem, index, self) => {
//         return index == self.indexOf(elem);
//     });
//     return unique_array
// }
//
//   function loadCarShowAjax(request, selectedDiv){
//     request.success(function(response){
//       if (response != null){
//       let uniqueUserList = removeDuplicateUsingFilter(response.users)
//       let newHTML = ''
//
//       newHTML += `<div><h1>${response.year} ${response.brand.name} ${response.name}</h1><a href="/cars/${currentID}/edit">Edit Car</a> <br> </div>
//         <br>
//
//         <img src="${response.photo_url}" alt="car photo" width="600" height="400" />
//         <!-- would be cool to have a "added by" section  -->
//
//           <p><strong>Brand: </strong> <a href="/brands/${response.brand_id}">${response.brand.name}</a></p>
//           <h4>Types: </h4>
//           <ul>`
//
//
//
//       for (let t of response.car_types) {
//         newHTML += `<li>${t.name}</li>`
//       }
//       newHTML += `
//           </ul>
//
//          <h4>Resources: </h4>
//          <ul>`
//
//       for (let r of response.resources){
//         newHTML += `<li><a href="/cars/${currentID}/resources/${r.id}">${r.title}</a></li>`
//       }
//
//       newHTML += `</ul>
//            <br>
//             <a href="/cars/${currentID}/resources/new">Add Resource For This Car</a>
//          </ul>
//
//          <h4>Owners: ${uniqueUserList.length}</h4>
//           <ul>`
//
//       for (let o of uniqueUserList){
//         newHTML += `<li><a href="/users/${o.id}">${o.username}</a></li>`
//         //must stop names from duplicating
//       }
//       newHTML += `</ul>`
//           selectedDiv.html(newHTML)
//         } else{
//           currentID -= 1
//         }
//     })
//
//   }
//
// })
