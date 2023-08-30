// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextDoubleWidget extends StatelessWidget {
  TextDoubleWidget({
    super.key,
    this.arrowVisibility = true,
    this.firstText,
    required this.secondText,
    this.topPaddingCheck = false,
  });
  final firstText;
  final secondText;
  final arrowVisibility;
  final topPaddingCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(children: [
        topPaddingCheck
            ? SizedBox(
                height: 84,
              )
            : SizedBox(),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            arrowVisibility
                ? Text(
                    firstText ?? '',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                : SizedBox(),
            Text(
              secondText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(
              width: 12,
            ),
            arrowVisibility
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 15,
                  )
                : SizedBox(),
          ],
        ),
      ]),
    );
  }
}
