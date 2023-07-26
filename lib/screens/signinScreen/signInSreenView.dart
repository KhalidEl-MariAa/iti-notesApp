import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    String? email;
  String? password;
 final GlobalKey<FormState> _globalKey =  GlobalKey();
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _globalKey ,

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Welcome again :',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 17),)),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    // ignore: body_might_complete_normally_nullable
                    validator: (value) {
                      if (value!.isEmpty){
                        return "can’t take null value ";
                      }
                      
                      
                    },
                    onChanged: (value){
                      email=value;
                    },
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
                    // ignore: body_might_complete_normally_nullable
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'can’t take null value';
                      }
                    },
                    onChanged: (value) {
                      password=value;
                    },
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
                  
                  onPressed: ()async {
                    if(_globalKey.currentState!.validate()){
                      
                        
                      
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email! , password: password!);
                    
                    }
                
        
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8)),
                  
                 child: Text('Sign In ',style: GoogleFonts.anekGurmukhi(),)),
                const  SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image(image: AssetImage('lib/assets/images/google logo.png')),
                      ),
                    )
                    ,const SizedBox(width: 8,),
                   const CircleAvatar( 
                    
                      backgroundColor: Colors.white,
                        radius: 25,
                        child: Image(image: AssetImage('lib/assets/images/truefaceLogo.png'),)                  
                      )
                    
                 ],)
        
                
              ],)
          ,),
        ),
      ));
  }
  }