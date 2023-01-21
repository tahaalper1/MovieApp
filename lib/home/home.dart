import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie/home/favorite.dart';
import 'package:movie/home/home_meu.dart';
import 'package:movie/home/profile.dart';

class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  State<home> createState() => _hometState();
}

class _hometState extends State<home> {
   
    
     GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
     var PageAll = [profile(), home_meu(), favorite()];
      int _page = 0;
      

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar : 
      CurvedNavigationBar(
        
        key: _bottomNavigationKey,
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        animationDuration: Duration(milliseconds: 300),
        color: Colors.orange,
        
        onTap: (index) {
        setState(() {
              setState(() {
                _page = index;
                if(_page==0){
                  
                }
              });
            });
    
        },
        
        items: [ 
          Icon(Icons.person,
          color: Colors.white,
          ),
          Icon(Icons.home,
          color: Colors.white,
          size: 50,),
          Icon(Icons.favorite,
          color: Colors.white,
          ),  
          
        ],
        
         
    
        
      ),
     body: PageAll[_page],

    
     
    );
  }
}
