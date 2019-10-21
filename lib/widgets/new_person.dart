import 'package:flutter/material.dart';

class NewPerson extends StatefulWidget {
  final Function addPer;
  NewPerson(this.addPer);

  @override
  _NewPersonState createState() => _NewPersonState();
}

class _NewPersonState extends State<NewPerson> {
  final _nameController = TextEditingController();

  void _submitData() {
    final enteredName = _nameController.text;

    if (enteredName.isEmpty) {
      return;
    }

    widget.addPer(enteredName);
    Navigator.of(context).pop();
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
              decoration: InputDecoration(labelText: 'Add a Person'),
              // onChanged: (value) => titleInput = value,
              controller: _nameController,
            ),
            RaisedButton(
              child: Text('Add Person'),
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
