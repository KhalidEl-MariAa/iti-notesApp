import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloScreenView extends StatefulWidget{
  const HelloScreenView({super.key});

  @override
  State<HelloScreenView> createState() => _HelloScreenViewState();
}

class _HelloScreenViewState extends State<HelloScreenView>  {

  void navigateToHome(){
      Future.delayed(Duration(seconds: 3),
      () {
        Navigator.popAndPushNamed(context, 'HomePageView');
      },);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHome();
  }
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
      Text('Welcome..',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 20),)

  ],

),),

     ));
  }
}

