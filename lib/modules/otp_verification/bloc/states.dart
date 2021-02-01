abstract class OtpVerificationStates{}
class InitialState extends OtpVerificationStates{}
class LoadingState extends OtpVerificationStates{}
class TimerState extends OtpVerificationStates{}
class SuccessState extends OtpVerificationStates{}

class ErrorState extends OtpVerificationStates{
  var error;
  ErrorState(error){
    this.error=error;
  }
}