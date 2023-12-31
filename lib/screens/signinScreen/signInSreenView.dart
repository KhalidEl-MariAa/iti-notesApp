
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool notseen=true;
  TextEditingController passcont =  TextEditingController();
  TextEditingController emailcont =  TextEditingController();
  
  

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}




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
                    controller: emailcont,
                    
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
                    controller: passcont,
                    obscureText: notseen,
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
                      suffixIcon: IconButton(
                        onPressed: (){
                          
                          
                          setState(() {
                            notseen=!notseen;
                          });
                            
                          
                        },
                       icon: notseen? const Icon(Icons.remove_red_eye) :const Icon (Icons.hide_source )),
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
                      
                        
                      
                   try{
                     await FirebaseAuth.instance.signInWithEmailAndPassword(email:email! , password: password!);
                     
                     Navigator.pushNamed(context, 'HomeScreenView',arguments: email);
                     
                   }
                   on FirebaseAuthException catch (ex){
                      if (ex.code=='user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No User found for this Email..Try register with it')));
                        }
                        else if (ex.code=='wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password ')));
                          
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('$ex')));
                        }

                        
                        
                    }
                    catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('There was an error (Not in your pass or email) ,Try Again ')));
                    }
                    }
                
        
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8)),
                  
                 child: Text('Sign In ',style: GoogleFonts.anekGurmukhi(),)),
                const  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed:()async {
                      try {
                        await signInWithGoogle();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('There was an error')));
                      }
                    } ,
                    style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8)),

                   
                   child: Row(
                     children: [
                      const Image(image: AssetImage('lib/core/assets/images/google logo.png'),height: 40,width: 45,),
                      const  SizedBox(width: 6,),
                       Text('Connect with google',style: GoogleFonts.anekGurmukhi())

                     ],
                   ),
                 )
                 ,const SizedBox(width: 8,)
        
                
              ],)
          ,),
        ),
      ));
  }
  }