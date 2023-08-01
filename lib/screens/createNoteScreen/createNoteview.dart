import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
TextEditingController titCont= TextEditingController();
String? title;
TextEditingController contentCont= TextEditingController();
String? content;

final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Form(
          key: _globalKey,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ TextFormField(
                        controller: titCont,
                        
                        // ignore: body_might_complete_normally_nullable
                        validator: (value) {
                          if (value!.isEmpty){
                            return "can’t take null value ";
                          }
                          
                          
                        },
                        onChanged: (value){
                          title=value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: GoogleFonts.anekGurmukhi(),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                          prefixIcon: const Icon(Icons.title),
                          
                        ),
                      ),
                      SizedBox(height: 20,),
                     TextFormField(
                        controller: contentCont,
                        
                        // ignore: body_might_complete_normally_nullable
                        validator: (value) {
                          if (value!.isEmpty){
                            return "can’t take null value ";
                          }
                          
                          
                        },
                        onChanged: (value){
                          content=value;
                        },
                        decoration: InputDecoration(
                          hintText: 'content',
                          hintStyle: GoogleFonts.anekGurmukhi(),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                          prefixIcon: const Icon(Icons.add_comment),
                          
                        ),
                      ),
                      SizedBox(height: 25,),
                      ElevatedButton(
                        onPressed: (){
                          
                        },
                         style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8)),
                  
                 child: Text('Add Note ',style: GoogleFonts.anekGurmukhi(),)) ],
                  ),
                ),
              )
            ],
          ),
        ),
    
        
      ),
    );
  }
}