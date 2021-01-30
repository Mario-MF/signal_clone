import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signal_cone/modules/otp_verification/otp_verification.dart';
import 'package:signal_cone/modules/registeraton/bloc/cubit.dart';
import 'package:signal_cone/modules/registeraton/bloc/states.dart';
import 'package:signal_cone/shared/components/components.dart';
import 'package:signal_cone/shared/styles/styles.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (BuildContext context) {

       var cubit = RegistrationCubit.get(context);
       cubit.getCountryName();
        return  BlocConsumer<RegistrationCubit,RegistrationStates>(
          listener: (context,state){
            if(state is ErrorState){
              Fluttertoast.showToast(
                  msg: state.error,
                  backgroundColor: Colors.red,
                toastLength: Toast.LENGTH_LONG
              );
            }
          },
          builder: (context,state){
            return  Scaffold(
              body: Padding(
                padding: EdgeInsets.all(25.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 40.0,vertical: 25.0),
                            child: Text('Enter your phone number to get started',
                              textAlign: TextAlign.center,
                              style: whiteBold22,),
                          ),
                          Text('You will receive a verification code. Carrier rates may apply',
                            textAlign: TextAlign.center,
                            style: white18,),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    width: 1.0,
                                    color: Colors.grey)
                            ),
                            child: CountryCodePicker(
                              alignLeft: true,
                              padding: EdgeInsets.only(left: 20.0),
                              onInit: (value){
                                cubit.getCountryCode(countryName: value.dialCode);
                              },
                              onChanged: (value){
                                cubit.getCountryCode(countryName: value.dialCode);
                              },
                              initialSelection: cubit.countryName,
                              dialogTextStyle: white16,
                              showFlagDialog: true,
                              showDropDownButton: true,
                              textOverflow: TextOverflow.ellipsis,
                              showOnlyCountryWhenClosed: true,
                              boxDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black
                              ),
                              showFlag: false,
                              enabled: true,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:60,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: cubit.countryCodeController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.grey,width: 1.0)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.grey,width: 1.0)
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.grey,width: 1.0)
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: cubit.phoneNumberController,
                                  decoration: InputDecoration(
                                      labelText: 'Phone number',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.grey,width: 1.0)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.grey,width: 1.0)
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.red,width: 1.0)
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Colors.grey,width: 1.0)
                                      )
                                  ),


                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: double.infinity,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              height: 50.0,
                              color: Colors.blue,
                              onPressed: () {
                                if(cubit.countryCodeController.text.isNotEmpty
                                    &&cubit.phoneNumberController.text.isNotEmpty){

                                  cubit.phoneVerification(
                                    context: context,
                                    countryCode: cubit.countryCodeController.text,
                                    phone: cubit.phoneNumberController.text
                                  );

                                }else{
                                  Fluttertoast.showToast(
                                      msg: 'All fields required',
                                    backgroundColor: Colors.red
                                  );
                                }

                              },
                              child: Text('NEXT',style: TextStyle(fontSize: 16),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(cubit.isLoading)
                      CircularProgressIndicator(),
                  ],
                ),
              ),

            );
          },
        );
      },)
    );
  }
}
