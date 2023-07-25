import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HelloScreenView extends StatefulWidget{
  const HelloScreenView({super.key});

  @override
  State<HelloScreenView> createState() => _HelloScreenViewState();
}

class _HelloScreenViewState extends State<HelloScreenView>  {
  @override
  Widget build(BuildContext context) {
    return SafeArea
    (child:
     Scaffold(
body: Center(child: Column(

  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,

  children: [

        SpinKitFadingCube(
      color: Colors.grey[300],
      size: 60,
      ),
      SizedBox(height: 30,),
      Text('Welcome..',)

  ],

),),

     ));
  }
}