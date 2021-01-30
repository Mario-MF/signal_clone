import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:signal_cone/shared/styles/styles.dart';

class OtpVerification extends StatelessWidget {
  String phoneNumber;

  OtpVerification({this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
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
                  Column(
                    children: [
                      Text('CALL ME INSTEAD'),
                      Text('(AVAILABLE IN 01:20)'),
                    ],
                  ),
                  Text('WRONG NUMBER'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
