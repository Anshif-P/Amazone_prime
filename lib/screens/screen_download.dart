// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Downloads',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 160,
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
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    child: Column(
                      children: [
                        Text(
                          'No videos downloaded',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              'Auto Downloads: On ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Manage',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 6, 122, 216),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
