import 'package:flutter/material.dart';
import 'record.dart';
import 'edit.dart';
import 'main.dart';

class Info extends StatelessWidget {
  Record record;
  Info({required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Person Info'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/spidey.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
              thickness: 1.0,
            ),
            Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10.0),
            Text(
                '${record.name}',
                style: TextStyle(
                  color: Colors.red,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 30.0),
            Text(
                'Phone Number',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10.0),
            Text(
                '${record.number}',
                style: TextStyle(
                  color: Colors.red,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
              thickness: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Edit(record: record)
                        ),
                      );
                    },
                    icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 25.0
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                  ),
                  SizedBox(width: 100.0),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 25.0,
                      ),
                  ),
                  SizedBox(width: 15.0),
                  Text(
                      'Call',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
