import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewHoliday extends StatefulWidget {
  final Function addHol;
  NewHoliday(this.addHol);

  @override
  _NewHolidayState createState() => _NewHolidayState();
}

class _NewHolidayState extends State<NewHoliday> {
  final _titleController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addHol(
      enteredTitle,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Add a Holiday'),
              // onChanged: (value) => titleInput = value,
              controller: _titleController,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(_selectedDate == null
                      ? 'No Date Chosen'
                      : DateFormat.yMMMd().format(_selectedDate)),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.blue,
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Title'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
