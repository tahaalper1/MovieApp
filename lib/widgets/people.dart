import 'package:flutter/material.dart';
import '../ultils/text.dart';
import 'descriptions/toprated2.dart';

class PEOPLE extends StatelessWidget {
    final List people1;

  const PEOPLE({Key key, this.people1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'POPULAR',
            size: 26,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: people1.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      
                      
                      child: Container(
                         width: 140,
                        child: Column(
                          
                          children: [
                            Container(
                             
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          people1[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  color: Colors.black,
                                  text: people1[index]['title'] != null
                                      ? people1[index]['title']
                                      : 'Loading'),
                            )
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