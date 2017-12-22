class UserCar {
  constructor(attributes){
    this.id = attributes.id
    this.color = attributes.color
    this.user_id = attributes.user_id
    this.car_id = attributes.car_id
  }

  renderForm(){
    UserCar.formTemplate()
  }

}

document.addEventListener("turbolinks:load", function(){
  $addUserCarButton = $(".add-a-car-button")
  $userCarFormDiv = $("#user-car-form-div")

  UserCar.formTemplateSource = $("#user-car-form-template")
  UserCar.formTemplate = Handlebars.compile(UserCar.formTemplateSource)

  $addUserCarButton.on("click", function(e){
    e.preventDefault();
    $userCarFormDiv.html(UserCar.renderForm())
  })






})
