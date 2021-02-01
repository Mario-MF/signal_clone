import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:signal_cone/modules/otp_verification/bloc/cubit.dart';
import 'package:signal_cone/modules/otp_verification/bloc/states.dart';
import 'package:signal_cone/shared/components/components.dart';
import 'package:signal_cone/shared/styles/styles.dart';

class OtpVerification extends StatelessWidget {
  String phoneNumber,verificationId;

  OtpVerification({this.phoneNumber,this.verificationId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Builder(
      builder: (BuildContext context) {
        var cubit = OtpVerificationCubit.get(context);
        cubit.timerCountDown();
        return BlocConsumer<OtpVerificationCubit, OtpVerificationStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 30.0),
                            child: Text(
                              'Enter the code we sent to $phoneNumber',
                              textAlign: TextAlign.center,
                              style: whiteBold25,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 300,
                            child: PinCodeTextField(
                              controller: cubit.pinController,
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              backgroundColor: Colors.transparent,
                              keyboardType: TextInputType.number,
                              enablePinAutofill: true,
                              textStyle: white16,
                              autoFocus: true,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                inactiveColor: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 40,
                                fieldWidth: 40,
                              ),
                              appContext: context,
                              onChanged: (String value) {},
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CountdownTimer(
                                endTime: cubit.endTime,
                                widgetBuilder: (_, CurrentRemainingTime time) {
                                  if (time == null) {
                                    return Text('CALL');
                                  }
                                  return Column(
                                    children: [
                                      Text('CALL ME INSTEAD'),
                                      time.min != null
                                          ? Text(
                                          '(AVAILABLE IN ${time.min}:${time.sec} )')
                                          : Text('(AVAILABLE IN 0:${time.sec} )'),
                                    ],
                                  );
                                },
                              ),
                              InkWell(
                                  onTap: () {
                                    print('clicked');
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'WRONG NUMBER',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            width: double.infinity,
                            child: MaterialButton(
                              child: Text('VERIFY'),
                              color: Colors.blue,
                              onPressed: () {
                                cubit.phoneAuthentication(
                                    context: context,
                                    code: cubit.pinController.text,
                                    verificationId: this.verificationId
                                );
                              },),
                          )
                        ],
                      ),
                      if( cubit.isLoading)
                        CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
