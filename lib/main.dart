import 'package:flutter/material.dart';
import 'package:flutter_ethiopian_date_converter/util/get_calander.dart';

import 'calculate_date.dart';
import 'generate_calander.dart';
import 'package:intl/intl.dart';

import 'mvc/model/ethiopian_date.dart';
import 'widgets/day_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

     supportedLocales: const [
      Locale('en', 'US'),
    Locale('am','ET'),
    ],
      home: const MyHomePage(title: 'የኢትዮጲያ ቀን መቁጠሪያ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  bool isVisible =true;
  EthiopianDate date = EthiopianDateConverter.calculateDate(DateTime.now());

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isVisible =true;
        date = EthiopianDateConverter.calculateDate(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  selectDate(context);
                },
                child: Text(DateFormat.yMd().format(selectedDate))),
            const SizedBox(height: 29),
          Visibility(visible:isVisible ,child:  Text(
              'ቀኑ  ${date.toStringFormat('MMM dd yyyy')}  ነው',
              style: const TextStyle(fontSize: 20),
            ),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(onPressed: () {
                          int month = date.month;
                          int year = date.year;
                          if (date.month == 1) {
                            month = 13;
                            year -= 1;
                          } else {
                            month -= 1;
                          }
                          setState(() {
                            isVisible =false;
                            date = EthiopianDate(1, month, year, '', 0);
                          });
                        }, child: const Icon(Icons.chevron_left)),
                        Text(
                          date.toStringFormat('MMM yyyy'),
                          style: const TextStyle(fontSize: 20),
                        ),
                        MaterialButton(onPressed: () {
                          int month = date.month;
                          int year = date.year;
                          if (date.month == 13) {
                            month = 1;
                            year += 1;
                          } else {
                            month += 1;
                          }
                          setState(() {
                            isVisible =false;
                            date = EthiopianDate(1, month, year, '', 0);
                          });
                        }, child: const Icon(Icons.chevron_right)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                      DayDisplay(text:'ሰ'),
                      DayDisplay(text:'ማክ'),
                      DayDisplay(text:'እሮ'),
                      DayDisplay(text:'ሀሙ'),
                      DayDisplay(text:'አር'),
                      DayDisplay(text:'ቅ'),
                      DayDisplay(text:'እሁ'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GenerateCalender(
                        ethiopianDate: GetCalender.generateCalender(date))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}