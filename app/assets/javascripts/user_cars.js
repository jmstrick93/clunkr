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

  //the below is asyncronous to ensure that the UserCar object has a brand_name attribute before the listing is rendered.
  //that functionality is deprecated but I am actively searching for an alternative.
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


function parseURL(){
  let thePath = window.location.pathname.split("/")
  let pathObject = {}
  pathObject["object"]=thePath[1]
  pathObject["id"] = thePath[2]
  return pathObject
}

document.addEventListener("turbolinks:load", function(){
  $addUserCarButton = $(".add-a-car-button")
  $newUserCarForm = $("form.new_user_car")
  $userCarFormDiv = $("#user-car-form-div")
  $userCarRenderDiv = $("ul#user-cars-list")

  UserCar.listingTemplateSource = $("#user-car-listing-template").html()
  UserCar.listingTemplate = Handlebars.compile(UserCar.listingTemplateSource)

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

  $newUserCarForm.on("submit", function(e){
    e.preventDefault()
    let values = $(this).serialize()
    let userId = parseURL().id
    //below is just stubbed out
    let posting = $.post(`/users/${userId}/user_cars.json`, values)
    posting.success(function(resp){
      let newUserCar = new UserCar(resp);
      $userCarRenderDiv.append(newUserCar.renderListing());
    }).error(function(resp){
      alert("Failed to post. Please try again later.")
    })
  })






})
