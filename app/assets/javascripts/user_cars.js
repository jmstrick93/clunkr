class UserCar {
  constructor(attributes){
    this.id = attributes.id
    this.color = attributes.color
    this.user_id = attributes.user.id
    this.car_id = attributes.car.id
    this.car = attributes.car
    this.brand = attributes.car.brand
    this.form = UserCar.formTemplateSource
    this.brand_name = this.getBrandName()
  }



  //the below is syncronous to ensure that the UserCar object has a brand_name attribute before the listing is rendered.
  getBrandName(){
    let brand_name
    $.ajax({
      type: "GET",
      url:`/cars/${this.car_id}.json`,
      async: false,
      success: function(resp){
        brand_name =  resp.brand.name
      }
    })
    return brand_name
  }

  renderListing(){
    return UserCar.listingTemplate(this)
  }

}


//for retrieving the current userID from the URL
function parseURL(){
  let thePath = window.location.pathname.split("/")
  let pathObject = {}
  pathObject["object"]=thePath[1]
  pathObject["id"] = thePath[2]
  return pathObject
}

document.addEventListener("turbolinks:load", function(){
  const $addUserCarButton = $(".add-a-car-button")
  const $newUserCarForm = $("form.new_user_car")
  const $userCarFormDiv = $("#user-car-form-div")
  const $userCarRenderDiv = $("ul#user-cars-list")

  UserCar.listingTemplateSource = $("#user-car-listing-template").html()
  UserCar.listingTemplate = Handlebars.compile(UserCar.listingTemplateSource)

  //toggles the new user_car form div
  $addUserCarButton.on("click", function(e){
    e.preventDefault();
    switch ($userCarFormDiv.prop("hidden")){
      case true:
        $userCarFormDiv.prop("hidden", false)
        break;
      case false:
        $userCarFormDiv.prop("hidden", true)
        break;
    }
  })

  //for submitting new user_car asynchronously
  $newUserCarForm.on("submit", function(e){
    e.preventDefault()
    let values = $(this).serialize()
    //retrieves the current userId from the URL
    let userId = parseURL().id
    //uses userId in post-request
    let posting = $.post(`/users/${userId}/user_cars.json`, values)
    posting.success(function(resp){
      //create new UserCar js 'object' & then feed it into handlebars template using UserCar.renderListing()
      let newUserCar = new UserCar(resp);
      $userCarRenderDiv.append(newUserCar.renderListing());
    }).error(function(resp){
      alert("Failed to post. Please try again later.")
    })
  })

  function renderCarsWithJS(){
    $userCarRenderDiv.empty()
    $.get(`/users/${parseURL().id}/user_cars`, function(resp){
      let sortedCarList = alphabatizeCars(resp)

      sortedCarList.forEach((userCar)=>{
        const newCarObj = new UserCar(userCar)

        $userCarRenderDiv.append(newCarObj.renderListing());
      })
    })

  }
  renderCarsWithJS();

  function alphabatizeCars(array){
    return array.sort((a, b) => {
      const brandNameA = a.car.name.toUpperCase();
      const brandNameB = b.car.name.toUpperCase();
      if (brandNameA > brandNameB) {
        return -1
      }
      if (brandNameB > brandNameA) {
        return 1
      }
      return 0
    })
  }



})
