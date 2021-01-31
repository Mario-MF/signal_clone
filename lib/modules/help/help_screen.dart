import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signal_cone/modules/help/cubit/help_cubit.dart';
import 'package:signal_cone/modules/help/cubit/help_state.dart';
import 'package:signal_cone/shared/components/components.dart';
import 'package:signal_cone/shared/styles/styles.dart';

class HelpScreen extends StatelessWidget {
  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCubit(),
      child: BlocConsumer<HelpCubit, HelpState>(
        builder: (context, state) {
          var helpCubit = HelpCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Help',
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  padding: EdgeInsets.all(17.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact us',
                        style: black600.copyWith(color: Colors.white70),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLines: 5,
                        // minLines: 4,
                        controller: comment,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Tell us what’s going on',
                            hintStyle: black700.copyWith(color: Colors.white54),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    // color: Colors.grey,
                                    width: 2.0,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3.0, style: BorderStyle.solid)),
                            filled: true,
                            fillColor: Colors.grey[800]),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            splashRadius: 0,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: helpCubit.check,
                            onChanged: helpCubit.changeCheckBox,
                            activeColor: Color(0xff5C94F5),
                            focusColor: helpCubit.check == false
                                ? Colors.white10
                                : Colors.black,
                          ),
                          Text('Include debug log .  ',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 17.5)),
                          Text(' What’s this?',
                              style: TextStyle(
                                  color: Color(0xff788DCE), fontSize: 17.5)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('How do you feel? (Optional)',
                          style: black700.copyWith(color: Colors.white70)),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset(
                              'assets/images/grinning-face_1f600.png',
                              width: 25,
                              height: 25,
                            ),
                            radius: 25,
                            backgroundColor: Colors.grey[800],
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          CircleAvatar(
                              child: Image.asset(
                                'assets/images/angry-face_1f620.png',
                                width: 25,
                                height: 25,
                              ),
                              radius: 25,
                              backgroundColor: Colors.grey[800]),
                          SizedBox(
                            width: 7,
                          ),
                          CircleAvatar(
                              child: Image.asset(
                                'assets/images/neutral-face_1f610.png',
                                width: 25,
                                height: 25,
                              ),
                              radius: 25,
                              backgroundColor: Colors.grey[800]),
                          SizedBox(
                            width: 7,
                          ),
                          CircleAvatar(
                              child: Image.asset(
                                'assets/images/slightly-frowning-face_1f641.png',
                                width: 25,
                                height: 25,
                              ),
                              radius: 25,
                              backgroundColor: Colors.grey[800]),
                          SizedBox(
                            width: 7,
                          ),
                          CircleAvatar(
                              child: Image.asset(
                                'assets/images/slightly-smiling-face_1f642.png',
                                width: 25,
                                height: 25,
                              ),
                              radius: 25,
                              backgroundColor: Colors.grey[800]),
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            width: 190,
                            height: 70,
                            child: Text(
                              'Have you read our FAQ yet?',
                              style:
                                  black600.copyWith(color: Color(0xff7490D1)),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          defultButton(
                              width: 80,
                              text: 'next',
                              height: 40.0,
                              color: Colors.grey[800],
                              borderColor: Colors.grey[800],
                              fontWeight: FontWeight.normal,
                              function: () {
                                print('next');
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
