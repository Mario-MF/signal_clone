import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'modules/registeraton/bloc/cubit.dart';
import 'package:signal_cone/modules/chats/chats_screen.dart';
import 'package:signal_cone/modules/chats/cubit/chats_cubit.dart';

void main()async {
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
          BlocProvider(create: (context) => RegistrationCubit()),
          BlocProvider(create: (context) => ChatsCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Signal',
          theme: ThemeData.dark(),
          home: ChatsScreen(),
          //HomeScreen(),
        ));
  }
}
