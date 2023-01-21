import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/ultils/text.dart';

import '../../home/home.dart';
import 'description.dart';



class Description1 extends StatelessWidget {
  
  final String  posterurl,vote;
  final List tv1;
 const Description1(
      {Key key, 
      this.posterurl,
      this.vote, this.tv1,
     })
      : super(key: key);

   
  @override
  Widget build(BuildContext context) {
      var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Card(
              child: Padding(
                padding:  EdgeInsets.only(bottom: yukseklik/20),
                child: SizedBox(
                  height: 700,
                  width: 700,
                  child: Container(      
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage(posterurl),
                      fit: BoxFit.cover
                    )),
                  ),
                ),
              ),
            
          ),
           Padding(
             padding:  EdgeInsets.only(top: yukseklik/1.1,left: en/100),
             child: Card(
                 child: SizedBox(
                  width: 300,
                  height: 40,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30,top: 5),
                     child: Positioned(
                      
                              bottom: 20,left: 20,
                              child: modified_text(text: '⭐ Average Rating - ' + vote, size: 20, color: Colors.black,)),
                   ),
                 
               ),
               
             ),
           ),],
      ),
    );
  }
}