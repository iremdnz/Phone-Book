import 'package:flutter/material.dart';
import 'record.dart';
import 'info.dart';
import 'main.dart';

class Edit extends StatefulWidget {
  Record record;
  Function(Record record) rFunc;
  Edit({required this.record});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  //TextEditingController _controller = new TextEditingController(text: '${record.name}');
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: '${widget.record.name}');
    TextEditingController _controller2 = TextEditingController(text: '${widget.record.number}');

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Edit Person'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25.0),
            Text(
                'Number',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  textStyle: const TextStyle(color: Colors.grey)),

              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
