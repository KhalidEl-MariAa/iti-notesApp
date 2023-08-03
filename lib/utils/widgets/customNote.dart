import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomNote extends StatelessWidget {
   CustomNote({super.key,required this.title,required this.content,this.ontap});
  String title;
  String content;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
           
           
            
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  subtitleTextStyle: GoogleFonts.anekGurmukhi().copyWith(),
                  title:  Text(title),
                  subtitle: Text(content),
                  isThreeLine: true,
                  trailing: Column(
                    children: [GestureDetector(
                      onTap:ontap ,
                      child:const  Icon(Icons.delete)),
                    const SizedBox(height: 5),
                    GestureDetector(child: const Icon(Icons.done))],
                  ) ,
        
                )
              ],
            )
          ),
        );
  }
}