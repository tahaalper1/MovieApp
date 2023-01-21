import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/main.dart';
class kayit extends StatefulWidget {

  @override
  State<kayit> createState() => _kayitState();
}

class _kayitState extends State<kayit> {
  
final email = TextEditingController();
final password = TextEditingController();
final name = TextEditingController();
final surname = TextEditingController();
final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String gender;
    var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;

    void showSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(" Boş Alanı Bırakmayın ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))
  );

}
Future <void> kayitol() async{
 try {
  await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((kullanici)
                    {
                      Navigator.of(context).pop();
                      FirebaseFirestore.instance.collection("Kullanicilar").doc(email.text)  
                    .set({"Kullanici e-posta": email.text, "Kullanici sifre": password.text, "Kullanıcı adı": name.text, "Telefon Numarası": phone.text}
                      
                      ).whenComplete(() => print("veritabanına kaydedildi")
                      ).whenComplete(() => print("kayıt tamamlandı"));
                       
                    }
                    
                    );  
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
                SizedBox(height: yukseklik/3.25),
                Padding(padding: EdgeInsets.only(right: en/2.5,top: yukseklik/30),
                child: Column(
                  
                  children: [
                    Text("",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ],
                ),            
                ),
                 SizedBox(height: yukseklik/12),
                 Padding(
                 padding: EdgeInsets.symmetric(horizontal: 50),
                 child: TextField(
                  style: TextStyle(color: Colors.orange),
                  controller: email,
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
          
               
                SizedBox(height: yukseklik/40),
                 Padding(
                 padding: EdgeInsets.symmetric(horizontal: 50),
                 child: TextField(
                  style: TextStyle(color: Colors.orange),
                  controller: name,
                      decoration: InputDecoration(
                        hintText: "KULLANICI ADI",hintStyle: TextStyle(color: Colors.orange),
                       enabledBorder: 
                      OutlineInputBorder(
                        borderSide: BorderSide( width: 3,
                          color: Colors.orange,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        
                      ),
                     prefixIcon: const Icon(Icons.people,color: Colors.orange),
                      focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.orange),
                    borderRadius: BorderRadius.circular(50),
                       ),
                   
                    ),
                    ),
               ),
               
                SizedBox(height: yukseklik/40),
                 Padding(
                 padding: EdgeInsets.symmetric(horizontal: 50),
                 child: TextField(
                  style: TextStyle(color: Colors.orange),
                  controller: phone,
                      decoration: InputDecoration(
                        hintText: "TELEFON NUMARASI",hintStyle: TextStyle(color: Colors.orange),
                        
                       enabledBorder: 
                      OutlineInputBorder(
                        borderSide: BorderSide( width: 3,
                         color: Colors.orange,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        
                      ),
                     prefixIcon: const Icon(Icons.phone,color: Colors.orange),
                      focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.orange),
                    borderRadius: BorderRadius.circular(50),
                       ),
                     
                    ),
                    ),
               ),
                SizedBox(height: yukseklik/40),
                 Padding(
                 padding: EdgeInsets.symmetric(horizontal: 50),
                 child: TextField(
                  style: TextStyle(color: Colors.orange,),
                  controller: password,
                      decoration: InputDecoration(
                        hintText: "ŞİFRE",hintStyle: TextStyle(color: Colors.orange,),
                       enabledBorder: 
                      OutlineInputBorder(
                        borderSide: BorderSide( width: 3,
                         color: Colors.orange,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        
                      ),
                     prefixIcon: const Icon(Icons.mail,color: Colors.orange),
                      focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.orange),
                    borderRadius: BorderRadius.circular(50),
                       ),
                    
                    ),
                    ),
               ),

                SizedBox(height: yukseklik/20),
             Padding(
               padding:  EdgeInsets.only(bottom: yukseklik/55),
               child: Container(
                
                margin: EdgeInsets.symmetric(horizontal: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.grey.shade100,
                  
                ),
                 child: Center(
                  child: TextButton(
                    
                    onPressed:  () { 
                     
                     kayitol();
                    
                    
                  }, child: Text(" Kayıt Ol ",style: TextStyle(color: Colors.orange),
                  ),
                 
                  
                  ),
                 ),
               ),
             ),

         
               
            
              ],
            ),
            ),
        ),
       
     
    );
  }
}