// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyVerticalDivider extends StatelessWidget {
  MyVerticalDivider({
    Key? key,
    this.color = Colors.grey,
    this.width = 0.3,
    this.height,
  }) : super(key: key);

  late Color color;
  late double width;
  late double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: width,
        ),
      ),
    );
  }
}
