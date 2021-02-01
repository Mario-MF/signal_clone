import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signal_cone/modules/otp_verification/bloc/states.dart';
class OtpVerificationCubit extends Cubit<OtpVerificationStates> {
  OtpVerificationCubit() : super(InitialState());

  static OtpVerificationCubit get(context) => BlocProvider.of(context);
  int endTime;
  var isLoading=false;
  var pinController=TextEditingController();

  timerCountDown() {
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
    emit(TimerState());
  }

  void phoneAuthentication({code,verificationId ,context}) async {
    emit(LoadingState());
    isLoading=true;
    PhoneAuthCredential phoneAuthCredential =
        PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
    await FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((value) {
          isLoading=false;
      print(value.user.uid);
      emit(SuccessState());
    }).catchError((error) {
      isLoading=false;
      emit(ErrorState(error));
    });
  }
}
