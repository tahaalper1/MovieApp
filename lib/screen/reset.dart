import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/screen/kayit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(password());
}




class password extends StatefulWidget {
  const password({Key key}) : super(key: key);

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
   final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final FirebaseFirestore firestore  = FirebaseFirestore.instance;

  @override
void dispose(){
  emailController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;

    void showSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(" Lütfen mail adresinizi girin ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))
  );
}

 Future passwordReset() async{
  try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
  Navigator.of(context).pop();
  }
   on FirebaseAuthException catch (e){
        showSnackBar(context, e.message);
       }
}
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back2.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: 
        SingleChildScrollView(
          child: Column(
              children: [
        
                Center(
                  child: Padding(
                    padding:EdgeInsets.only(top: yukseklik/2),
                    child: Text("Lütfen E-Mail adresinizi girin", style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.w500),),
                  ),
                ),
              SizedBox(height: yukseklik/50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: emailController,
                      style: TextStyle(color: Colors.orange),
                      keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "E-MAIL",hintStyle: TextStyle(color: Colors.orange,),
                            
                           enabledBorder: 
                          OutlineInputBorder(
                            borderSide: BorderSide( width: 3,
                              color: Colors.orange,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            
                            
                          ),
                         prefixIcon: const Icon(Icons.mail, color: Colors.orange),
                         focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.orange),
                      borderRadius: BorderRadius.circular(50),
                         ),
                         
                         
                        ),
                      
                        
                        ),
                ),
                SizedBox(height: yukseklik/20),
               Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.grey.shade100,
                ),
                 child: Center(
                  child: TextButton(onPressed: () {
                         passwordReset();
                         
        
                  }, child: Text(" Bağlantı Gönder ",style: TextStyle(color: Colors.orange),),
                  
                  ),
                 ),
                 
               ),
                SizedBox(height: yukseklik/5.25),
             Center(
              child: TextButton(onPressed: () {    
              }, child: Text(" "),
              ),
             ),
              ],
            ),
        ),
        ),
      
      
    );
  }
}