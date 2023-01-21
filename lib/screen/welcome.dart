import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/screen/MyHomePage.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../welcome/page1.dart';
import '../welcome/page2.dart';
import '../welcome/page3.dart';


class Welcome extends StatefulWidget {
  
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
     body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // page view
          Padding(
            padding:  EdgeInsets.only(bottom: yukseklik/100),
            child: SizedBox(
              height: yukseklik/1.25,
              width: en/0.8,
              child: PageView(
                controller: _controller,
                children: const [
                  page1(),
                  page2(),
                  page3(),
                ],
              ),
            ),
          ),

        
          Padding(
            padding:  EdgeInsets.only(top: yukseklik/120),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: JumpingDotEffect(
                activeDotColor: Colors.orange,
                dotColor: Colors.grey.shade200,
                dotHeight: 10,
                dotWidth: 20,
                spacing: 10,
                //verticalOffset: 50,
                jumpScale: 3,  
              ),
            ),
          ),
         
          Center(
            child: Padding(
              padding:  EdgeInsets.only(bottom: yukseklik/25, right: en/12, left: en/12),
              child: SlideAction(
                borderRadius: 25,
                elevation: 0,
                innerColor: Colors.orange,
                outerColor: Colors.grey.shade200,
                sliderButtonIcon: Icon(
                  Icons.lock_open,
                  color: Colors.white,
                ),
                text: "WELCOME",
                onSubmit: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyHomePage()));  
                },
              ),
            ),
          ),
        ],
        
      ),
      
    );
  }
}
     
     