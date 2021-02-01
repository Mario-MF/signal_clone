
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:signal_cone/modules/otp_verification/otp_verification.dart';
import 'package:signal_cone/modules/registeraton/bloc/states.dart';
import 'package:signal_cone/shared/components/components.dart';

class RegistrationCubit extends Cubit<RegistrationStates>{
  RegistrationCubit() : super(InitialState());
  static RegistrationCubit get(context)=>BlocProvider.of(context);

  String countryName;
  String countryCode;
  bool isLoading=false;
  var countryCodeController = TextEditingController();
  var phoneNumberController = TextEditingController();


  getCountryName() async {
      countryName = await FlutterSimCountryCode.simCountryCode;
      print(countryName);
      emit(GetCountryNameState());
  }

  Future<void>getCountryCode({countryName})async{
    countryCode = await countryName;
    countryCodeController.text=countryCode;
    print(countryCode);
    emit(GetCountryCodeState());
  }
  void phoneVerification({phone,countryCode, context}) async
  {
    emit(LoadingState());
    isLoading=true;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$countryCode$phone',
      verificationCompleted: (PhoneAuthCredential credential)
      {

      },
      verificationFailed: (FirebaseAuthException e)
      {
        isLoading=false;
        emit(ErrorState(e.message));
        print(e.message);
      },
      codeSent: (String verificationId, int resendToken)
      {
        isLoading=false;
        navigateTo(context: context,widget: OtpVerification(
          phoneNumber:'$countryCode$phone' ,
          verificationId: verificationId,
        ));
        emit(SuccessState());
      },
      codeAutoRetrievalTimeout: (String verificationId)
      {

      },
    );
  }

}