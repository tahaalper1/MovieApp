import 'package:flutter/material.dart';

import '../ultils/text.dart';
import 'descriptions/tv2.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key key, this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                       onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TV2(
                                      name: tv[index]['original_name'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['poster_path'],
                                      description: tv[index]['overview'],
                                      vote: tv[index]['vote_average']
                                          .toString(),
                                      launch_on: tv[index]
                                          ['release_date'],
                                    )));
                      },
                     
                      // color: Colors.green,
                     
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                           width: 275,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path']),
                                      fit: BoxFit.cover),
                                ),
                                height: 140,
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: modified_text(
                                    size: 15,
                                    color: Colors.black,
                                    text: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
                                        : 'Loading'),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}