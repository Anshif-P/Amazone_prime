// ignore_for_file: prefer_const_constructors

import 'package:amazone_prime_video/model/model_class.dart';
import 'package:amazone_prime_video/screens/screenFind/search_card_widget.dart';
import 'package:amazone_prime_video/service/api_servce.dart';
import 'package:flutter/material.dart';

class ScreenSearchPage extends StatefulWidget {
  ScreenSearchPage({super.key});
  @override
  State<ScreenSearchPage> createState() => _ScreenSearchPageState();
}

String? values;

class _ScreenSearchPageState extends State<ScreenSearchPage> {
  List<movies> moviesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 248,
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
                    backgroundImage: AssetImage('lib/images/th (2).jpeg'),
                  )
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 46,
                      width: 370,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            values = value;
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 18),
                            hintText: 'Actor, title, or genre',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[500],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Results',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 233,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 79, 77, 77),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SearchCardWidget(
                  moviesList: [],
                  playIconCheck: true,
                  functionType: MoviesApi.search(values),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
