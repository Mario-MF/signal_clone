import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signal_cone/cubit/home_screen.dart';
// import 'package:signal_cone/modules/chats/cubit/chats_cubit.dart';
// import 'modules/chats/chats_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) =>ChatsCubit()),
      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        title: 'Signal',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.black),
        ),
        home: HomeScreen(),
      ),
    );
  }
}


