// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amazone_prime_video/screens/screen_home/screen_all.dart';
import 'package:amazone_prime_video/screens/screen_home/screen_movies.dart';
import 'package:amazone_prime_video/screens/screen_home/screen_tv_show.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> isShowTabbar = ValueNotifier<bool>(true);

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SafeArea(
            child: DefaultTabController(
              length: 3,
              child: Stack(
                children: [
                  TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [ScreenAll(), ScreenMovies(), ScreenTvShows()]),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: ValueListenableBuilder(
                      valueListenable: isShowTabbar,
                      builder: (context, value, _) {
                        return AnimatedContainer(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                          duration: Duration(milliseconds: 10),
                          height: isShowTabbar.value == true ? 100 : 0,
                          // color: Colors.grey.withOpacity(0.5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'lib/images/prime-video-logo-new-edited one.png',
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 194,
                                  ),
                                  Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        AssetImage('lib/images/th (2).jpeg'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TabBar(
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        indicatorColor: Colors.transparent,
                                        labelColor: Colors.black,
                                        isScrollable: true,
                                        unselectedLabelColor: Colors.white,
                                        labelPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        indicatorPadding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        tabs: [
                                          Tab(
                                            text: 'All',
                                          ),
                                          Tab(
                                            text: 'Movies',
                                          ),
                                          Tab(
                                            text: 'TV Shows',
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
