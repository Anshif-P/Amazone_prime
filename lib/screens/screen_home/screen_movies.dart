// ignore_for_file: prefer_const_constructors, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:amazone_prime_video/screens/screen_home/screen_home.dart';
import 'package:amazone_prime_video/screens/screen_home/card_widget.dart';
import 'package:amazone_prime_video/screens/screen_home/text_double_widget.dart';
import 'package:amazone_prime_video/service/api_servce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenMovies extends StatefulWidget {
  ScreenMovies({super.key});

  @override
  State<ScreenMovies> createState() => _ScreenMoviesState();
}

class _ScreenMoviesState extends State<ScreenMovies> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MoviesApi.recentlyAddedList();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListner);
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              TextDoubleWidget(
                secondText: ' - Recently added movies',
                arrowVisibility: true,
                topPaddingCheck: true,
                firstText: 'Prime',
              ),
              SizedBox(
                height: 10,
              ),
              CardWidget(functionType: MoviesApi.recentlyAddedList()),
              SizedBox(
                height: 35,
              ),
              TextDoubleWidget(
                secondText: ' - Recommended movies',
                arrowVisibility: true,
                firstText: 'Prime',
              ),
              SizedBox(
                height: 10,
              ),
              CardWidget(functionType: MoviesApi.recomendedMovies()),
              SizedBox(
                height: 35,
              ),
              TextDoubleWidget(
                secondText: ' - Amazone Originals and Exclusinve movies',
                firstText: 'Prime',
                arrowVisibility: true,
              ),
              SizedBox(
                height: 10,
              ),
              CardWidget(
                cardSizeCheck: true,
                functionType: MoviesApi.exclusivesMovies(),
              ),
              SizedBox(
                height: 35,
              ),
              TextDoubleWidget(
                secondText: ' - Latest movies',
                firstText: 'Prime',
                arrowVisibility: true,
              ),
              SizedBox(
                height: 10,
              ),
              CardWidget(functionType: MoviesApi.latestMovies()),
              SizedBox(
                height: 35,
              ),
              TextDoubleWidget(
                secondText: ' - Top movies',
                firstText: 'Prime',
                arrowVisibility: true,
              ),
              SizedBox(
                height: 10,
              ),
              CardWidget(functionType: MoviesApi.topMovies()),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ],
    );
  }

  scrollListner() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      isShowTabbar.value = false;
    } else {
      isShowTabbar.value = true;
    }
    isShowTabbar.notifyListeners();
  }
}
