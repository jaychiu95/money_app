import 'package:flutter/material.dart';

import '../models/person.dart';
import '../widgets/new_person.dart';
import '../widgets/person_list.dart';

class HolidayScreen extends StatefulWidget {
  final String holidayId;
  final String holidayTitle;

  HolidayScreen(this.holidayId, this.holidayTitle);

  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  final List<Person> _userPerson = [];

  void _addNewPerson(String perName) {
    final newPerson = Person(id: DateTime.now().toString(), name: perName);

    setState(() {
      _userPerson.add(newPerson);
    });
  }

  void _startAddNewPerson(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewPerson(_addNewPerson);
        });
  }

  void _deletePerson(String id) {
    setState(() {
      _userPerson.removeWhere((per) {
        return per.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.holidayTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewPerson(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[PersonList(_userPerson, _deletePerson)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewPerson(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
