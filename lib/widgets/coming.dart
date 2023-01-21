import 'package:flutter/material.dart';
import '../ultils/text.dart';
import 'descriptions/toprated2.dart';

class COMING extends StatelessWidget {
    final List coming;

  const COMING({Key key, this.coming}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Up Coming Movies',
            size: 26,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coming.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                       onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Toprated2(
                                      name: coming[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              coming[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              coming[index]['poster_path'],
                                      description: coming[index]['overview'],
                                      vote: coming[index]['vote_average']
                                          .toString(),
                                      launch_on: coming[index]
                                          ['release_date'],
                                    )));
                      },
                      
                      
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
                                          coming[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  color: Colors.black,
                                  text: coming[index]['title'] != null
                                      ? coming[index]['title']
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