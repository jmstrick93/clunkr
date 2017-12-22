class UserCar {
  constructor(attributes){
    this.id = attributes.id
    this.color = attributes.color
    this.user_id = attributes.user_id
    this.car_id = attributes.car_id
    this.form = UserCar.formTemplateSource
  }
}

document.addEventListener("turbolinks:load", function(){
  $addUserCarButton = $(".add-a-car-button")
  $userCarFormDiv = $("#user-car-form-div")

  UserCar.formTemplateSource = $("#user-car-form-template").html();
  UserCar.formTemplate = Handlebars.compile(UserCar.formTemplateSource);
  debugger;

  $addUserCarButton.on("click", function(e){
    e.preventDefault();
    debugger;

  })






})
