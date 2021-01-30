import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signal_cone/cubit/home_screen.dart';
import 'package:signal_cone/modules/registeraton/bloc/cubit.dart';
import 'package:signal_cone/modules/registeraton/otp_auth_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>RegistrationCubit())

        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signal',
      theme: ThemeData.dark(),
      home:OtpScreen(), //HomeScreen(),
    ));
  }
}


