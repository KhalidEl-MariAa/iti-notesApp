
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AddProfilePicView extends StatefulWidget {
  const AddProfilePicView({super.key});
  

  @override
  State<AddProfilePicView> createState() => _AddProfilePicViewState();
}

class _AddProfilePicViewState extends State<AddProfilePicView> {
  File? imagefile;
  var imagepicker= ImagePicker();
   var pickedimag;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundImage: imagefile==null?  null : FileImage(imagefile!)  ,
                radius: 65,
                child: imagefile!=null? null :Icon(
                Icons.person ,size: 60,)
                  ),SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                      ),
                      onPressed: ()async {
                         pickedimag= await imagepicker.pickImage(source: ImageSource.camera);
                        if (pickedimag!=null) {
                          imagefile=File(pickedimag.path);
                          setState(() {
                            
                          });
                          
                        }
                        
                        else{

                        }
                      },
                       child: Row(children: [Text('Take a photo',style: GoogleFonts.anekGurmukhi(),),SizedBox(width: 6,),Icon(Icons.camera_alt)]
                       )
                       ),const SizedBox(width: 10,),
                       ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                      ),
                      onPressed: ()async {
                         pickedimag= await imagepicker.pickImage(source: ImageSource.gallery);
                        if (pickedimag!=null) {
                          imagefile=File(pickedimag.path);
                          
                          setState(() {
                            
                          });
                          
                        }
                        
                        else{

                        }
                      },
                       child:  Row(children: [Text('From Gallery',style: GoogleFonts.anekGurmukhi(),),SizedBox(width: 6,),Icon(Icons.add_photo_alternate)]
                       )
                       )
                  ],),
              
              SizedBox(height: 17,),
              Text('Choose Your profile pricture',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 20,color: Colors.amber),)
            ,TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
                ,
              ),
              onPressed: ()async {
              if (imagefile!=null){
                await FirebaseStorage.instance.ref('images/${basename(pickedimag.path)}').putFile(imagefile!);
                
                Navigator.pushNamed(context, 'HomeScreenView',arguments: ModalRoute.of(context)!.settings.arguments);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error')));
              }

              }, child: Text('Next',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 17),))],
          ),
        ),
      ));
  }
}