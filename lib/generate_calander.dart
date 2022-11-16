import 'package:flutter/material.dart';

import 'mvc/model/ethiopian_day.dart';

class GenerateCalender extends StatefulWidget {
  final  EthiopianMonth ethiopianDate;
  const GenerateCalender({Key? key, required this.ethiopianDate}) : super(key: key);

  @override
  State<GenerateCalender> createState() => _GenerateCalenderState();
}

class _GenerateCalenderState extends State<GenerateCalender> {
  @override
  Widget build(BuildContext context) {
 
    int count =( widget.ethiopianDate.dates.length/7).ceil();
    return Expanded(
      child: ListView.builder(
        itemCount: count,
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
                        color: widget.ethiopianDate.dates[i].isSelected
                            ? Colors.green
                            : widget.ethiopianDate.dates[i].isBetween
                                ? Colors.grey
                                : Colors.white,
                        borderRadius: widget.ethiopianDate.dates[i].isSelected
                            ? widget.ethiopianDate.dates[i].isFirst
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
                        widget.ethiopianDate.dates[i].day.toString(),
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
