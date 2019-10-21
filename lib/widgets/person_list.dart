import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonList extends StatelessWidget {
  final List<Person> people;
  final Function deletePer;

  PersonList(this.people, this.deletePer);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: people.isEmpty
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Enter a person',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/empty.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return InkWell(
                    splashColor: Colors.blue,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              people[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deletePer(people[index].id),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: people.length,
              ),
      ),
    );
  }
}
