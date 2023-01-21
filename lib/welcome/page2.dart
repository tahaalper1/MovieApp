import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  const page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child:Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/page2.png"),
            fit: BoxFit.cover,
          ),
        ),
          ),
        ),
      ),
    );
  }
}