import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomNote extends StatefulWidget {
   CustomNote({super.key,required this.title,required this.content,this.ontap,required this.snapshot,required this.index});
  String title;
  String content;
  void Function()? ontap;
  
  var snapshot;
  var index;

  @override
  State<CustomNote> createState() => _CustomNoteState();
}

class _CustomNoteState extends State<CustomNote> {
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
                  title:  Text(widget.title),
                  subtitle:  Text(widget.content),
                  isThreeLine: true,
                  trailing: Column(
                    children: [
                      GestureDetector(
                      onTap:widget.ontap ,
                      child:const  Icon(Icons.delete)),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
              await myTransaction.delete(widget.snapshot.data?.docs[widget.index].reference as DocumentReference<Object?>);
          });
                      },
                    child:  const Icon(Icons.done))],
                  ) ,
                  
                )
              ],
            ),
          ),
        );
  }
}