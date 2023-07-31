import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key});

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
                  title: const Text('title'),
                  subtitle: const Text('content'),
                  isThreeLine: true,
                  trailing: Column(
                    children: [GestureDetector(child:const  Icon(Icons.delete)),
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