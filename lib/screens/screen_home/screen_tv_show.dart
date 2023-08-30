// ignore_for_file: prefer_const_constructors, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:amazone_prime_video/screens/screen_home/screen_home.dart';
import 'package:amazone_prime_video/screens/screen_home/card_widget.dart';
import 'package:amazone_prime_video/screens/screen_home/text_double_widget.dart';
import 'package:amazone_prime_video/service/api_servce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenTvShows extends StatelessWidget {
  ScreenTvShows({super.key});

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListn);
    return ListView(
      shrinkWrap: true,
      children: [
        TextDoubleWidget(
          secondText: " - TV show we think you'll like",
          arrowVisibility: true,
          topPaddingCheck: true,
          firstText: 'Prime',
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(functionType: MoviesApi.topSeries()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Top TV',
          arrowVisibility: true,
          firstText: 'Prime',
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(functionType: MoviesApi.topTV()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Amazone Originals and Exclusinve Tv Show',
          firstText: 'Prime',
          arrowVisibility: true,
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(
            cardSizeCheck: true, functionType: MoviesApi.exclusiveTVShows()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Mystery and thriller TV',
          firstText: 'Prime',
          arrowVisibility: true,
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(functionType: MoviesApi.mysteryAndTrillerTV()),
        SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Drama TV',
          firstText: 'Prime',
          arrowVisibility: true,
        ),
        SizedBox(
          height: 10,
        ),
        CardWidget(functionType: MoviesApi.recentlyAddedList()),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }

  scrollListn() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      isShowTabbar.value = false;
    } else {
      isShowTabbar.value = true;
    }
    isShowTabbar.notifyListeners();
  }
}
