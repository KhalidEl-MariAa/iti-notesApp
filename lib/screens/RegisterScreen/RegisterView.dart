import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Welcome to our Registeration :',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 17),)),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.anekGurmukhi(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    prefixIcon: const Icon(Icons.email),
                    
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.anekGurmukhi(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    prefixIcon: const Icon(Icons.lock),
                    
                  ),
                ),
              ),
             const  SizedBox(height: 25,),

              ElevatedButton(
                
                onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
                backgroundColor: const Color.fromARGB(255, 8, 8, 8)),
                
               child: Text('Register',style: GoogleFonts.anekGurmukhi(),)),
              const  SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?..',style: GoogleFonts.anekGurmukhi(),),
                  GestureDetector(
                    onTap: (){},
                    child: Text('Sign in',style: GoogleFonts.anekGurmukhi().copyWith(color: Colors.amber)),)

               ],)

              
            ],)
        ,),
      ));
  }
}