import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/holiday.dart';
import '../screens/holiday_screen.dart';

class HolidayList extends StatelessWidget {
  final List<Holiday> holidays;
  final Function deleteHol;

  HolidayList(this.holidays, this.deleteHol);

  void selectHoliday(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return HolidayScreen(holidays[0].id, holidays[0].title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: holidays.isEmpty
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Get started by adding a holiday!',
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
                    onTap: () => selectHoliday(context),
                    splashColor: Colors.blue,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              holidays[index].title,
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
                            child: Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(holidays[index].date),
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteHol(holidays[index].id),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: holidays.length,
              ),
      ),
    );
  }
}
