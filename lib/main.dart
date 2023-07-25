import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:iti_project/firebase_options.dart';
import 'package:iti_project/screens/helloScreen/helloScreenView.dart';
import 'package:iti_project/screens/homeScreen/homepageView.dart';



void main() async {
  
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
    runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HelloScreenView(),
        'HomePageView':(context) => HomePageView()

      },
     theme: ThemeData(brightness: Brightness.dark,),
      initialRoute:'/' ,
    );
  }
}
