import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/utils/widgets/create%20widgets/createNote.dart';
import 'package:iti_project/utils/widgets/create%20widgets/createTask.dart';


class CreateNoteandTasksScreen extends StatefulWidget {
  const CreateNoteandTasksScreen({super.key});

  @override
  State<CreateNoteandTasksScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteandTasksScreen> {

int currentIndex =0;
List views=[CreateNote(),CreateTask()];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        
       body: views[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle:GoogleFonts.anekGurmukhi() ,
          enableFeedback: true,
          
          onTap: (value) {
            setState(() {
              currentIndex=value;
            });
            
          },
          backgroundColor: Colors.black,
          currentIndex: currentIndex,
          items:const [
            BottomNavigationBarItem(
              label:'Add Note',
              icon: Icon(Icons.add_comment_outlined)),
    
    
            BottomNavigationBarItem(

              label: 'Add Task',
              icon: Icon(Icons.add_task))
          ]),

      
    ));
  }
}