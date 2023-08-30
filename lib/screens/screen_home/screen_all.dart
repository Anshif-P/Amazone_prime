// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:amazone_prime_video/screens/screen_home/card_widget.dart';
import 'package:amazone_prime_video/screens/screen_home/text_double_widget.dart';
import 'package:amazone_prime_video/service/api_servce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'screen_home.dart';

class ScreenAll extends StatelessWidget {
  ScreenAll({
    super.key,
  });
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    MoviesApi.recentlyAddedList();
    scrollController.addListener(scrollListner);
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      children: [
        TextDoubleWidget(
          firstText: 'Prime',
          secondText: ' - Recently added movies',
          arrowVisibility: true,
          topPaddingCheck: true,
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(functionType: MoviesApi.recentlyAddedList()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
            secondText: 'Continue Watching', arrowVisibility: false),
        SizedBox(
          height: 10,
        ),
        CardWidget(
            playIconCheck: true, functionType: MoviesApi.exclusivesMovies()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          firstText: 'Prime',
          secondText: ' - Amazone Originals and Exclusives',
          arrowVisibility: true,
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(cardSizeCheck: true, functionType: MoviesApi.topSeries()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          firstText: 'Prime',
          secondText: ' - Latest movies',
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
            firstText: 'Prime',
            arrowVisibility: true,
            secondText: ' - Arabic subtitles'),
        SizedBox(
          height: 10,
        ),
        CardWidget(functionType: MoviesApi.exclusiveTVShows()),
        SizedBox(
          height: 35,
        )
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
