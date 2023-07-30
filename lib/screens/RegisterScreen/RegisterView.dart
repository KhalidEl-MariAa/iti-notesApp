  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/utils/firebaseNames.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool notseen=true;
  TextEditingController passcont =  TextEditingController();
  
  String? email;
  String? password;
  String? firstname;
  String? secondname;
 final GlobalKey<FormState> _globalKey =  GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                    child: Text('Welcome to our Registeration :',style: GoogleFonts.anekGurmukhi().copyWith(fontSize: 17),)),
                ),
                const SizedBox(height: 25,),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 175,
                        child: TextFormField(
                          
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty){
                              return "can’t take null value ";
                            }
                            
                            
                          },
                          onChanged: (value){
                            firstname=value;
                          },
                          
                          decoration: InputDecoration(
                            
                            hintText: 'first name',
                            hintStyle: GoogleFonts.anekGurmukhi(),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            prefixIcon: const Icon(Icons.person),
                            
                          ),
                        ),
                      ),
                      
                      SizedBox(
                        width: 175,
                        child: TextFormField(
                          
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty){
                              return "can’t take null value ";
                            }
                            
                            
                          },
                          onChanged: (value){
                            secondname=value;
                          },
                          
                          decoration: InputDecoration(
                            
                            hintText: 'Last name',
                            hintStyle: GoogleFonts.anekGurmukhi(),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            prefixIcon: const Icon(Icons.person),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
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
                    controller: passcont,
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
                      
                        
                      
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email! , password: password!);
                        await FirebaseFirestore.instance.collection(FirebaseNames.collectionNamme).add(
                          {
                            FirebaseNames.emailfield:email,
                            FirebaseNames.passfiels:password,
                            FirebaseNames.firstNameField:firstname,
                            FirebaseNames.lastNameField:secondname
                          });
                    }
                    on FirebaseAuthException catch (ex){
                      if (ex.code=='weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Weak password..Try stronger one ')));
                        }
                        else if (ex.code=='email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email already used in another account..Try another one ')));
                          
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('There is a problem with your input data')));
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
                  
                 child: Text('Register',style: GoogleFonts.anekGurmukhi(),)),
                const  SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?..',style: GoogleFonts.anekGurmukhi(),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'SignInView');
                      },
                      child: Text('Sign in',style: GoogleFonts.anekGurmukhi().copyWith(color: Colors.amber)),)
        
                 ],)
        
                
              ],)
          ,),
        ),
      ));
  }
}