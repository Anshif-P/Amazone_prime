// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:amazone_prime_video/model/model_class.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {super.key,
      required this.functionType,
      this.cardSizeCheck = false,
      this.playIconCheck = false});
  final playIconCheck;
  final cardSizeCheck;
  Future<List<movies>> functionType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: functionType,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Display a loading indicator while waiting.
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available.');
          } else if (snapshot.hasData) {
            final moviesList =
                snapshot.data!; // Assuming Movie is the correct data typ

            return cardSizeCheck
                ? Container(
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesList.length,
                        itemBuilder: (context, index) {
                          final data = moviesList[index].posterPath == null
                              ? moviesList[++index]
                              : moviesList[index];

                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${data.posterPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 200,
                              width: 120,
                            ),
                          );
                        }),
                  )
                : Container(
                    height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesList.length,
                        itemBuilder: (context, index) {
                          final data = moviesList[index].posterPath == null
                              ? moviesList[++index]
                              : moviesList[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${data.posterPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 200,
                              child: playIconCheck
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 4),
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
                                    )
                                  : SizedBox(),
                            ),
                          );
                        }),
                  );
          } else {
            return SizedBox();
          }
        });
  }
}
