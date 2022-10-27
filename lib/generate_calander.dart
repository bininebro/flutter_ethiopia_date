import 'package:flutter/material.dart';

class GenerateCalender extends StatefulWidget {
  const GenerateCalender({Key? key}) : super(key: key);

  @override
  State<GenerateCalender> createState() => _GenerateCalenderState();
}

class _GenerateCalenderState extends State<GenerateCalender> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    bool isBetween = true;
    bool isFirst = false;

    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          int value = index * 7;
          return Row(
            //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = index * 7; i < (index * 7) + 7; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.green
                            : isBetween
                                ? Colors.grey
                                : Colors.white,
                        borderRadius: isSelected
                            ? isFirst
                                ? const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))
                            : BorderRadius.circular(1)),
                    height: 35,
                    child: Center(
                      child: Text(
                        (i).toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
