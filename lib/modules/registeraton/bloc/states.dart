abstract class RegistrationStates {}
class InitialState extends RegistrationStates{}
class LoadingState extends RegistrationStates{}
class GetCountryNameState extends RegistrationStates{}
class GetCountryCodeState extends RegistrationStates{}
class SuccessState extends RegistrationStates{}
class ErrorState extends RegistrationStates{
  var error;
  ErrorState(error){
    this.error = error;
  }
}