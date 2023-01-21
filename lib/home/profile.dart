import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie/home/home.dart';
import 'package:movie/screen/kayit.dart';
import 'package:movie/screen/reset.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(profile());
}

class profile extends StatefulWidget {
  const profile({Key key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}


class _profileState extends State<profile> {


  @override
  Widget build(BuildContext context) {
      var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;
   final FirebaseAuth auth = FirebaseAuth.instance;
   final User user = auth.currentUser;
    final uid = user?.email;



    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
       appBar: 
       AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.orange,
        title: Center( 
         child:Padding(
          padding: EdgeInsets.only(top: yukseklik/50,bottom: 30,left: en/30,right: en/30),
        child: Text("HESABIM",
        style: TextStyle(
          fontSize: 24,

        ),
        ),
        ),
      ),
      ),
      
    
       
    );
  }
}

//title: Text(data['Kullanıcı adı']),