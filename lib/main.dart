import 'package:flutter/material.dart';

import './widgets/holiday_list.dart';
import './widgets/new_holiday.dart';
import './models/holiday.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//  String titleInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Holiday> _userHolidays = [
    // Holiday(
    //   id: '1',
    //   title: 'Paris',
    //   date: DateTime.now(),
    // ),
    // Holiday(
    //   id: '2',
    //   title: 'Hong Kong',
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewHoliday(String holTitle, DateTime chosenDate) {
    final newHol = Holiday(
      title: holTitle,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userHolidays.add(newHol);
    });
  }

  void _startAddNewHoliday(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewHoliday(_addNewHoliday);
        });
  }

  void _deleteHoliday(String id) {
    setState(() {
      _userHolidays.removeWhere((hol) {
        return hol.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewHoliday(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HolidayList(_userHolidays, _deleteHoliday),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewHoliday(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
