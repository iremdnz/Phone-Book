import 'package:flutter/material.dart';
import 'record.dart';
import 'package:phone_book/record_model.dart';

class Edit extends StatefulWidget {
  RecordModel? recordMdl;
  Function(RecordModel? record) rFunc;
  Edit({required this.recordMdl, required this.rFunc});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  RecordModel?  _recordModel;

  @override
  void initState() {
   _recordModel = widget.recordMdl;
    super.initState();
  }
  //TextEditingController _controller = new TextEditingController(text: '${record.name}');
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: '${widget.recordMdl?.name}');
    TextEditingController _controller2 = TextEditingController(text: '${widget.recordMdl?.number}');


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
              onPressed: () {
                _recordModel?.name = _controller.text;
                _recordModel?.number = _controller2.text;
                widget.rFunc(_recordModel);
                Navigator.pop(context);
              },
              child: const Text('Save'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
