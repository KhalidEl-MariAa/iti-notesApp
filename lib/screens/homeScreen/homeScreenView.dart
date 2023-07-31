import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int currentIndex=0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:currentIndex==0? 
        FloatingActionButton(
          splashColor: Colors.amber,
          onPressed: (){},// Notes part
          child: const Icon(Icons.add),):
          FloatingActionButton(
            onPressed: (){}, // tasks Part
            child: const Icon(Icons.add)
            ),
        appBar: AppBar(
          title: currentIndex==0?
          Text('Notes',style: GoogleFonts.anekGurmukhi().copyWith(fontWeight: FontWeight.bold),):
           Text('Tasks',style: GoogleFonts.anekGurmukhi().copyWith(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: const Icon(Icons.menu),
          actions: [IconButton(
            iconSize: 30,
    
            onPressed: () {
            
          }, icon:const Icon(Icons.person))],
        ),
       
        
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
      ),
    );
  }
}