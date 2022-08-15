import 'package:flutter/material.dart';
import 'record.dart';
import 'edit.dart';
import 'package:phone_book/record_model.dart';

class Info extends StatefulWidget {
  RecordModel? recordMdl;
  Info({required this.recordMdl});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  RecordModel?  _recordModel;

  void initState() {
    _recordModel = widget.recordMdl;
    super.initState();
  }

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
                '${_recordModel?.name}',
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
                '${_recordModel?.number}',
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
                    onPressed: ()  {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Edit(recordMdl: widget.recordMdl, rFunc: rFunc,)
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

  rFunc(RecordModel? record) {
    setState(() {
      _recordModel = record;
    });


  }
}
