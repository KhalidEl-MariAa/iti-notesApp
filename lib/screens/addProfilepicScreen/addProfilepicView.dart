import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProfilePicView extends StatefulWidget {
  const AddProfilePicView({super.key});

  @override
  State<AddProfilePicView> createState() => _AddProfilePicViewState();
}

class _AddProfilePicViewState extends State<AddProfilePicView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                child: GestureDetector(
                  onTap: (){
                    
                  },
                  child: Icon(
                  Icons.add_photo_alternate,size: 60,),
                )
                  ),
              
              SizedBox(height: 25,),
              Text('Choose Your profile pricture',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 20),)
            ],
          ),
        ),
      ));
  }
}