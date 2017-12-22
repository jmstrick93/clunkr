class UserCar {
  constructor(attributes){
    this.id = attributes.id
    this.color = attributes.color
    this.user_id = attributes.user_id
    this.car_id = attributes.car_id
    this.form = UserCar.formTemplateSource
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
    let posting = $.post(`/users/${userId}/user_cars`, values)
    posting.success(function(resp){
      console.log(resp)
      debugger;
    })
  })






})
