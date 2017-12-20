document.addEventListener("turbolinks:load", function(){
  const $infoDiv = $("div.car-show-info")
  const $prevCarButton = $("a#prev-car-button")
  const $nextCarButton = $("a#next-car-button")



  $prevCarButton.on("click", function(e){
    e.preventDefault()
    loadCarShowAjax($.get("/cars/1.json"), $infoDiv)
  })

  $nextCarButton.on("click", function(e){
    e.preventDefault()
    alert("next car")
  })

  function loadCarShowAjax(request, selectedDiv){
    request.done(function(response){
      selectedDiv.html(`<div><h1>1493 Chevrolet Impalaaa</h1><a href="/cars/1/edit">Edit Car</a> <br> </div>
        <br>

        <img src="https://upload.wikimedia.org/wikipedia/commons/1/11/1965_Chevrolet_Impala_Super_Sport_Coupe_%281%29.JPG" alt="1965 chevrolet impala super sport coupe %281%29" width="600" height="400" />
        <!-- would be cool to have a "added by" section  -->

          <p><strong>Brand: </strong> <a href="/brands/3">Chevrolet</a></p>

          <h4>Types: </h4>
          <ul>
              <li>sedan</li>
              <li>coupe</li>
          </ul>

         <h4>Resources: </h4>
         <ul>
           <!-- had to create custom route for this below; normal car_resource_path only designed to work when used from a car/1/resources kind of route; that one was mixing up the car id and the resource id -->
             <li><a href="/cars/1/resources/1">1969 Chevy Impala Owners Manual - manual</a></li>
           <!-- had to create custom route for this below; normal car_resource_path only designed to work when used from a car/1/resources kind of route; that one was mixing up the car id and the resource id -->
             <li><a href="/cars/1/resources/5">1969 Chevrolet Impala Custom Coupe Five-Speed - video</a></li>
           <br>
            <a href="/cars/1/resources/new">Add Resource For This Car</a>
         </ul>

         <h4>Owners: 1</h4>
          <ul>
              <li><a href="/users/3">Mike</a></li>
          </ul>
          `
        )
    })

  }

})
