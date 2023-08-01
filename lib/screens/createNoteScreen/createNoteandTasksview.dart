import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CreateNoteandTasksScreen extends StatefulWidget {
  const CreateNoteandTasksScreen({super.key});

  @override
  State<CreateNoteandTasksScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteandTasksScreen> {
TextEditingController titCont= TextEditingController();
String? title;
TextEditingController contentCont= TextEditingController();
String? content;
int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        
    
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle:GoogleFonts.anekGurmukhi() ,
          enableFeedback: true,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              currentIndex=value;
            });
            
          },
          backgroundColor: Colors.black,
          currentIndex: currentIndex,
          items:const [
            BottomNavigationBarItem(
              label:'Notes',
              icon: Icon(Icons.note_alt_sharp)),
    
    
            BottomNavigationBarItem(

              label: 'Tasks',
              icon: Icon(Icons.task_rounded))
          ]),

      
    ));
  }
}