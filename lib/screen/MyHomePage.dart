
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/home/home.dart';
import 'package:movie/screen/kayit.dart';
import 'package:movie/screen/reset.dart';
import 'package:movie/screen/welcome.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final emailController = TextEditingController();
final passwordController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore firestore  = FirebaseFirestore.instance;

 
@override
void dispose(){
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}

void showSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(" Hatalı Giriş ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))
  );

}

  @override 
  Widget build(BuildContext context){
    var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;


    Future<User>giris(String email, String password) async{
       
       try 
       {
         var user = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  home()));  
         return user.user;
         
       }
       on FirebaseAuthException catch (e){
        showSnackBar(context, e.message);
       }

    }
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: 
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back2.png"),
            fit: BoxFit.cover,
          ),
        ),

        
        child: SingleChildScrollView(
          child: Column(  
            children: [
              
              
              
              
              SizedBox(height: yukseklik/2.25),
               Padding(
               padding: EdgeInsets.symmetric(horizontal: 50),
               child: TextField(
                style: TextStyle(color: Colors.black ),
                controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-MAIL",hintStyle: TextStyle(color: Colors.orange ),
                      
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
        
              SizedBox(height: yukseklik/30),
               Padding(
               padding: EdgeInsets.symmetric(horizontal: 50),
               child: TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.orange ),
                obscureText: true,
                    decoration: InputDecoration(
                      
                      hintText: "ŞİFRE",hintStyle: TextStyle(color:Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,
                          color: Colors.orange,  
                        ),
                        borderRadius: BorderRadius.circular(50),  
                      ),
                      prefixIcon: const Icon(Icons.password, color:Colors.orange),
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
                color: Colors.black,
              ),
               child: Center(
                child: TextButton(
                  onPressed:  () { 
                    giris(emailController.text, passwordController.text).then((kullanici){
                    },      
                    );   
                }, child: Text(" Giriş Yap ",style: TextStyle(color: Colors.white),),
                ),
               ),
             ),
        
             SizedBox(height: yukseklik/40),
             Container(  
              margin: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.orange,
              ),
               child: Center(
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => kayit()));       
                }, child: Text(" Hesap Oluştur ",style: TextStyle(color: Colors.white),),   
                ),
               ),
             ),
               SizedBox(height: yukseklik/10.8),
             Center(
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => password()));       
                
              }, child: Text(" Şifremi Unuttum ",style: TextStyle(color: Colors.orange),),
              
              ),
             ),

             
            ],    
          ),  
          ),
      ), 
     );
    
  
  }
}









                      