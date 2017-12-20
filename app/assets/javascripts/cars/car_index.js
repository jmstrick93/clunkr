document.addEventListener("turbolinks:load", function(){
  const $carListDiv =  $("body.index.cars div#car-index-list")
  debugger;
  $carListDiv.html(`<div>
  <a href="/cars/1"><img src="https://upload.wikimedia.org/wikipedia/commons/1/11/1965_Chevrolet_Impala_Super_Sport_Coupe_%281%29.JPG" alt="1965 chevrolet impala super sport coupe %281%29" width="300" height="200" /></a>
  <p><a href="/cars/1">1493 Chevrolet Impalaaa</a></p>
  <br></br>
</div>`)
})
