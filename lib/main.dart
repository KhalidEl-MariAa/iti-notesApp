import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:iti_project/firebase_options.dart';
import 'package:iti_project/screens/RegisterScreen/RegisterView.dart';
import 'package:iti_project/screens/helloScreen/helloScreenView.dart';
import 'package:iti_project/screens/homeScreen/homeScreenView.dart';
import 'package:iti_project/screens/signinScreen/signInSreenView.dart';




void main() async {
  
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
    runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const HelloScreenView(),
        'RegisterPageView':(context) =>  const RegisterView(),
        'SignInView':(context) => const SignInView(),
        'HomeScreenView':(context) => const HomeScreenView()
      },
     theme: ThemeData(brightness: Brightness.dark,),
      initialRoute:'/' ,
    );
  }
}
