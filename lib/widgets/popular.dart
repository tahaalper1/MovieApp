import 'package:flutter/material.dart';
import 'package:movie/widgets/descriptions/storyview.dart';

import '../ultils/text.dart';

class TV1 extends StatelessWidget {
  final List tv1;

  const TV1({Key key, this.tv1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Visions',
            size: 26,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv1.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description1(
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv1[index]['poster_path'],
                                    
                                      vote: tv1[index]['vote_average'].toString(),
                                         
                                                                 )));
                      },
                      child: Container(
                     padding: EdgeInsets.only(top: 5,right: 2,left: 2),
                      // color: Colors.green,
                      width: 90,
                      child: Column(
                        
                        children: [
                          
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                             border: Border.all(color: Colors.orange,width: 2.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv1[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),

                            
                            height: 90,
                          ),
                        
                        ],
                      ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}