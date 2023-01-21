import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/ultils/text.dart';



class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

 const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
     var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;
   
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 248, 248, 248),

      body: Container(
        child: ListView(children: [
          
            
               Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Positioned(
                    
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 225),
                    child: Card(
                      child: 
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top: 5),
                          child: Positioned(
                              bottom: 10,left: 15,
                              child: modified_text(text: '⭐ Average Rating - ' + vote, size: 20, color: Colors.black,)),
                        ),
                      ),
                    ),
                  ),
                
              ],
              ),
              
          SizedBox(height: 5),
          
          Container(
            
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 26,color: Colors.black,)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  modified_text(text: 'Releasing On - ' + launch_on, size: 18, color: Colors.black,)),
                   Flexible(
                child: Container(
                    padding: EdgeInsets.only(top: 20,left: 10),
                    child: modified_text(text: description, size: 18, color: Colors.black,)),
              ),
          Row(   
            children: [         
              SizedBox(
                width: 350,
                height: 250,
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Container(
                    child: Image.network(posterurl),
                  ),
                ),
              ),
              ],
          ),
          
            
        ]),
      ),
    );

  }
  
}

