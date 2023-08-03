import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomNote extends StatefulWidget {
   CustomNote({super.key,required this.title,required this.content,this.ontap});
  String title;
  String content;
  void Function()? ontap;
  bool done = false;

  @override
  State<CustomNote> createState() => _CustomNoteState();
}

class _CustomNoteState extends State<CustomNote> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(10),
          child: AnimatedContainer(
           
           
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              color: widget.done==true?Colors.green: Colors.amber,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  subtitleTextStyle: GoogleFonts.anekGurmukhi().copyWith(),
                  title: widget.done==true?Text('Done..',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 30),) : Text(widget.title),
                  subtitle: widget.done==true? Text(widget.title): Text(widget.content),
                  isThreeLine: true,
                  trailing: Column(
                    children: [GestureDetector(
                      onTap:widget.ontap ,
                      child:const  Icon(Icons.delete)),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.done=true;
                        });
                      },
                      child:widget.done==true?Text(''): const Icon(Icons.done))],
                  ) ,
        
                )
              ],
            )
          ),
        );
  }
}