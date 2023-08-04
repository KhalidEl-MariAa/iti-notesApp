
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/utils/firebaseNames.dart';


class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: FutureBuilder( 
        future: FirebaseFirestore.instance.collection(FirebaseNames.collectionNamme).doc(ModalRoute.of(context)!.settings.arguments as String).get(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
        return Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            const CircleAvatar(child: Icon(Icons.person,size: 50),radius: 40,),
             const SizedBox(height: 12,),
             Row(
              children: [Text('${snapshot.data![FirebaseNames.firstNameField]}'),
              const SizedBox(width: 5,) ,Text('${snapshot.data![FirebaseNames.lastNameField]}')],

             ),
             Opacity(
              opacity: 0.5,
              child: Text('${snapshot.data![FirebaseNames.emailfield]}'))
              ],
            ),
          );
          }
          else if (snapshot.data==null){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return const Center(child: Text('Sorry there was an error..try again'),);

          }
          else{
            return const CircularProgressIndicator();
          }
        },
       ),
      ));
  }
}

/* */
