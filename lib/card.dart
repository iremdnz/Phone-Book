import 'package:flutter/material.dart';
import 'record.dart';

class PCard extends StatelessWidget {
  Record record;
  Function() showInfo;
  Function() delete;
  PCard({required this.record, required this.showInfo, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/spidey.jpg'),
                radius: 30.0,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 4,
            child: Text(
              record.name,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              )
            ),
          ),
          SizedBox(width: 6.0),
          Expanded(
            flex: 1,
            child: Icon(
              Icons.phone,
              color: Colors.green,
              size: 25.0,
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: showInfo,
              icon: Icon(
                Icons.info,
                color: Colors.blue,
                size: 25.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: delete,
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
