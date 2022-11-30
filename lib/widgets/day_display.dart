import 'package:flutter/material.dart';

class DayDisplay extends StatelessWidget {
  final String text;
  const DayDisplay({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 50,

      height: 35,
      child: Center(
        child: Text(
        text,
          textAlign: TextAlign.center,

        ),

      ),
    );
  }
}
