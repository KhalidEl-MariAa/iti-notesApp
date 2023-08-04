



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/utils/firebaseNames.dart';
import 'package:iti_project/utils/widgets/customNote.dart';

// ignore: must_be_immutable
class TasksView extends StatelessWidget {
   TasksView({super.key,required this.argument});
  String argument;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(FirebaseNames.collectionNamme).doc(argument).collection('Tasks').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: prefer_is_empty
          return snapshot.data?.docs.length==0 ? Center(child: Text('You did not add Tasks yet..try',style: GoogleFonts.anekGurmukhi().copyWith(fontWeight: FontWeight.bold),)):
              ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return CustomNote(
                index: index,
                snapshot: snapshot,
                ontap: () async{
                     await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
    await myTransaction.delete(snapshot.data?.docs[index].reference as DocumentReference<Object?>);
});
                },
                title:snapshot.data!.docs[index]['title'] ,
                 content: snapshot.data!.docs[index]['content']);
            },);
          
        }
        else if( snapshot.data==null){
          return const Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Text('Sorry there was an error try agian');
        }

        else{
          return const CircularProgressIndicator();
        }
       
        
      }, );
    
    }
    }


 //itemCount: snapshot.data!.docs.length,
 //FirebaseFirestore.instance.collection(FirebaseNames.collectionNamme).doc(argument).collection('Notes').get(),
 //title: snapshot.data!.docs[index]['title'],
                