// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../model/model_class.dart';

// ignore: must_be_immutable
class SearchCardWidget extends StatelessWidget {
  SearchCardWidget({
    Key? key,
    required this.functionType,
    this.cardSizeCheck = false,
    this.playIconCheck = false,
    required this.moviesList,
  }) : super(key: key);

  final bool playIconCheck;
  final bool cardSizeCheck;
  final Future<List<movies>> functionType;
  List<movies> moviesList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<movies>>(
      future: functionType,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return Text('No data available.');
        } else if (snapshot.hasData) {
          moviesList = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              final data = moviesList[index].posterPath == null
                  ? moviesList[++index]
                  : moviesList[index];

              return Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 17),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(1.0),
                                    BlendMode.softLight,
                                  ),
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${data.posterPath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            if (playIconCheck)
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Text(
                          data.title,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        alignment: Alignment(0, -1),
                        height: 80,
                        width: 30,
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        } else {
          return Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Text('hai hello'),
          );
        }
      },
    );
  }
}
